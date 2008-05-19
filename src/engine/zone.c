/*
Copyright (C) 1996-1997 Id Software, Inc.

This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version 2
of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.

*/
// Z_zone.c

#include "quakedef.h"
#include <windows.h>

#define	DYNAMIC_SIZE	0xc000

#define	ZONEID	0x1d4a11
#define MINFRAGMENT	64

typedef struct memblock_s
{
	int		size;           // including the header and possibly tiny fragments
	int     tag;            // a tag of 0 is a free block
	int     id;        		// should be ZONEID
	struct memblock_s       *next, *prev;
	int		pad;			// pad to 64 bit boundary
} memblock_t;

typedef struct
{
	int		size;		// total bytes malloced, including header
	memblock_t	blocklist;		// start / end cap for linked list
	memblock_t	*rover;
} memzone_t;

void Cache_FreeLow(int new_low_hunk);
void Cache_FreeHigh(int new_high_hunk);


/*
==============================================================================

						ZONE MEMORY ALLOCATION

There is never any space between memblocks, and there will never be two
contiguous free memblocks.

The rover can be left pointing at a non-empty block

The zone calls are pretty much only used for small strings and structures,
all big things are allocated on the hunk.
==============================================================================
*/

memzone_t	*mainzone;

void Z_ClearZone(memzone_t *zone, int size);


/*
========================
Z_ClearZone
========================
*/
void Z_ClearZone(memzone_t *zone, int size)
{
}


/*
========================
Z_Free
========================
*/
void Z_Free(void *ptr)
{
	int *zblock = ((int *) ptr) - 1;

	if (zblock[0] != ZONEID)
	{
		Sys_Error("Z_Free: freed a pointer without ZONEID");
	}

	free(zblock);
}


/*
========================
Z_Malloc
========================
*/
void *Z_Malloc(int size)
{
	int *zblock = (int *) malloc(size + sizeof(int));

	if (!zblock)
	{
		Sys_Error("Z_Malloc: failed on allocation of %i bytes", size);
	}

	memset(zblock, 0, size + sizeof(int));

	zblock[0] = ZONEID;

	return (zblock + 1);
}

void *Z_TagMalloc(int size, int tag)
{
	return Z_Malloc(size);
}

void Z_Print(memzone_t *zone)
{
}

void Z_CheckHeap(void)
{
}

//============================================================================

void *hunk_tempptr = NULL;

void Hunk_TempFree(void)
{
	if (hunk_tempptr)
	{
		free(hunk_tempptr);
		hunk_tempptr = NULL;
	}
}

void *Hunk_TempAlloc(int size)
{
	Hunk_TempFree();
	hunk_tempptr = malloc(size);

	return hunk_tempptr;
}


#define   HUNK_SENTINAL   0x1df001ed

typedef struct
{
	int      sentinal;
	int      size;
	char   name[8];
} hunk_t;

typedef struct hunk_type_s
{
	byte *hunkbuffer;
	int maxmb;
	int lowmark;
	int used;
} hunk_type_t;


hunk_type_t high_hunk = {NULL, 32 * 1024 * 1024, 0, 0};
hunk_type_t low_hunk = {NULL, 1024 * 1024 * 1024, 0, 0};


void *Hunk_TypeAlloc(hunk_type_t *ht, int size, char *name)
{
	hunk_t *hp;

	if (!ht->hunkbuffer)
	{
#ifdef _WIN32
		ht->hunkbuffer = VirtualAlloc(NULL, ht->maxmb, MEM_RESERVE, PAGE_NOACCESS);
#else
		// to do
#endif
		ht->lowmark = 0;
		ht->used = 0;
	}

	size = sizeof(hunk_t) + ((size + 15) & ~15);

	while (ht->lowmark + size >= ht->used)
	{
#ifdef _WIN32
		VirtualAlloc(ht->hunkbuffer + ht->used, 65536, MEM_COMMIT, PAGE_READWRITE);
#else
		// to do
#endif
		ht->used += 65536;
	}

	hp = (hunk_t *)(ht->hunkbuffer + ht->lowmark);
	ht->lowmark += size;

	memcpy(hp->name, name, 8);
	hp->sentinal = HUNK_SENTINAL;
	hp->size = size;

	memset((hp + 1), 0, size - sizeof(hunk_t));
	return (hp + 1);
}


void Hunk_TypeFreeToLowMark(hunk_type_t *ht, int mark)
{
	memset(ht->hunkbuffer + mark, 0, ht->used - mark);
	ht->lowmark = mark;
}


int Hunk_TypeLowMark(hunk_type_t *ht)
{
	return ht->lowmark;
}


void Hunk_Check(void)
{
	/* used in cl_parse.c */
}
void *Hunk_AllocName(int size, char *name)
{
	return Hunk_TypeAlloc(&low_hunk, size, name);
}
void *Hunk_Alloc(int size)
{
	return Hunk_TypeAlloc(&low_hunk, size, "unused");
}
int   Hunk_LowMark(void)
{
	return Hunk_TypeLowMark(&low_hunk);
}
void Hunk_FreeToLowMark(int mark)
{
	Hunk_TypeFreeToLowMark(&low_hunk, mark);
}
int   Hunk_HighMark(void)
{
	Hunk_TempFree();
	return Hunk_TypeLowMark(&high_hunk);
}
void Hunk_FreeToHighMark(int mark)
{
	Hunk_TempFree();
	Hunk_TypeFreeToLowMark(&high_hunk, mark);
}
void *Hunk_HighAllocName(int size, char *name)
{
	Hunk_TempFree();
	return Hunk_TypeAlloc(&high_hunk, size, name);
}

/*
===============================================================================

CACHE MEMORY

===============================================================================
*/

typedef struct cache_system_s
{
	int                  size;
	cache_user_t         *user;
	char               name[MAX_OSPATH];
	struct cache_system_s   *next;
	struct cache_system_s   *prev;
} cache_system_t;

cache_system_t *cache_head = NULL;
cache_system_t *cache_tail = NULL;


void Cache_FreeLow(int new_low_hunk)
{
	/* used by hunk */
}
void Cache_FreeHigh(int new_high_hunk)
{
	/* used by Hunk */
}
void Cache_Report(void)
{
	/* used in cl_main.c */
}
void *Cache_Check(cache_user_t *c)
{
	return c->data;
}

void Cache_Free(cache_user_t *c)
{
	cache_system_t *cs = ((cache_system_t *) c) - 1;

	if (cs->prev)
	{
		cs->prev->next = cs->next;
	}
	else
	{
		cache_head = cs->next;
	}

	if (cs->next)
	{
		cs->next->prev = cs->prev;
	}
	cache_tail = cs->prev;

	// prevent Cache_Check from blowing up
	cs->user->data = NULL;

	free(cs);
}


void *Cache_Alloc(cache_user_t *c, int size, char *name)
{
	cache_system_t *cs = NULL;

	for (cs = cache_head; cs; cs = cs->next)
		if (!strcmp(cs->name, name))
		{
			return cs->user->data;
		}

	if (c->data)
	{
		Sys_Error("Cache_Alloc: allready allocated");
	}
	if (size <= 0)
	{
		Sys_Error("Cache_Alloc: size %i", size);
	}

	cs = (cache_system_t *) malloc(sizeof(cache_system_t) + size);
	cs->next = cache_head;

	if (!cache_head)
	{
		cache_head = cs;
		cs->prev = NULL;
	}
	else
	{
		cache_tail->next = cs;
		cs->prev = cache_tail;
	}

	cache_tail = cs;
	cs->next = NULL;

	strcpy(cs->name, name);
	cs->size = size;
	cs->user = c;

	c->data = (cs + 1);

	return c->data;
}

//============================================================================


/*
========================
Memory_Init
========================
*/
void Memory_Init(void *buf, int size)
{
	free(host_parms.membase);
	host_parms.memsize = low_hunk.maxmb;
}

