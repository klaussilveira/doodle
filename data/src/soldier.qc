/*
==============================================================================

SOLDIER / PLAYER

==============================================================================
*/

$cd id1/models/soldier3
$origin 0 -6 24
$base base		
$skin skin

$frame run1 run2 run3 run4 run5 run6 run7 run8 run9 run10 run11 run12 run13 run14 run15 run16 run17 run18 run19 run20 run21 run22 run23 run24 run25 run26 run27 run28 run29 run30

$frame death1 death2 death3 death4 death5 death6 death7 death8 death9 death10 death11 death12 death13 death14 death15 death16 death17 death18 death19 death20 death21 death22 death23 death24 death25 death26 death27 death28 death29 death30

$frame shoot1 shoot2 shoot3 shoot4 shoot5 shoot6 shoot7 shoot8 shoot9 shoot10

$frame idle1 idle2 idle3 idle4 idle5 idle6 idle7 idle8 idle9 idle10 idle11 idle12 idle13 idle14 idle15 idle16 idle17 idle18 idle19 idle20 idle21 idle22 idle23 idle24 idle25 idle26 idle27 idle28 idle29 idle30 idle31 idle32 idle33 idle34 idle35 idle36 idle37 idle38 idle39 idle40 idle41 idle42 idle43 idle44 idle45 idle46 idle47 idle48 idle49 idle50 idle51 idle52 idle53 idle54 idle55 idle56 idle57 idle58 idle59 idle60 idle61 idle62 idle63 idle64 idle65 idle66 idle67 idle68 idle69 idle70 idle71 idle72 idle73 idle74 idle75 idle76 idle77 idle78 idle79 idle80 idle81 idle82 idle83 idle84 idle85 idle86 idle87 idle88 idle89 idle90 idle91 idle92 idle93 idle94 idle95 idle96 idle97 idle98 idle99 idle100 idle101 

$frame hit1 hit2 hit3 hit4 hit5 hit6 hit7

/*
==============================================================================
SOLDIER CODE
==============================================================================
*/

void() army_fire;

void()	army_stand1	=[	$idle1,	army_stand2	] {ai_stand();self.nextthink = time + 0.08;};
void()	army_stand2	=[	$idle2,	army_stand3	] {ai_stand();self.nextthink = time + 0.08;};
void()	army_stand3	=[	$idle3,	army_stand4	] {ai_stand();self.nextthink = time + 0.08;};
void()	army_stand4	=[	$idle4,	army_stand5	] {ai_stand();self.nextthink = time + 0.08;};
void()	army_stand5	=[	$idle5,	army_stand6	] {ai_stand();self.nextthink = time + 0.08;};
void()	army_stand6	=[	$idle6,	army_stand7	] {ai_stand();self.nextthink = time + 0.08;};
void()	army_stand7	=[	$idle7,	army_stand8	] {ai_stand();self.nextthink = time + 0.08;};
void()	army_stand8	=[	$idle8,	army_stand9	] {ai_stand();self.nextthink = time + 0.08;};
void()	army_stand9	=[	$idle9,	army_stand10	] {ai_stand();self.nextthink = time + 0.08;};
void()	army_stand10	=[	$idle10,	army_stand11	] {ai_stand();self.nextthink = time + 0.08;};
void()	army_stand11	=[	$idle11,	army_stand12	] {ai_stand();self.nextthink = time + 0.08;};
void()	army_stand12	=[	$idle12,	army_stand13	] {ai_stand();self.nextthink = time + 0.08;};
void()	army_stand13	=[	$idle13,	army_stand14	] {ai_stand();self.nextthink = time + 0.08;};
void()	army_stand14	=[	$idle14,	army_stand15	] {ai_stand();self.nextthink = time + 0.08;};
void()	army_stand15	=[	$idle15,	army_stand16	] {ai_stand();self.nextthink = time + 0.08;};
void()	army_stand16	=[	$idle16,	army_stand17	] {ai_stand();self.nextthink = time + 0.08;};
void()	army_stand17	=[	$idle17,	army_stand18	] {ai_stand();self.nextthink = time + 0.08;};
void()	army_stand18	=[	$idle18,	army_stand19	] {ai_stand();self.nextthink = time + 0.08;};
void()	army_stand19	=[	$idle19,	army_stand20	] {ai_stand();self.nextthink = time + 0.08;};
void()	army_stand20	=[	$idle20,	army_stand21	] {ai_stand();self.nextthink = time + 0.08;};
void()	army_stand21	=[	$idle21,	army_stand22	] {ai_stand();self.nextthink = time + 0.08;};
void()	army_stand22	=[	$idle22,	army_stand23	] {ai_stand();self.nextthink = time + 0.08;};
void()	army_stand23	=[	$idle23,	army_stand24	] {ai_stand();self.nextthink = time + 0.08;};
void()	army_stand24	=[	$idle24,	army_stand25	] {ai_stand();self.nextthink = time + 0.08;};
void()	army_stand25	=[	$idle25,	army_stand1	] {ai_stand();self.nextthink = time + 0.08;};

void()	army_walk1	=[	$run1,	army_walk2	] {ai_walk(1);self.nextthink = time + 0.08;};
void()	army_walk2	=[	$run2,	army_walk3	] {ai_walk(1);self.nextthink = time + 0.08;};
void()	army_walk3	=[	$run3,	army_walk4	] {ai_walk(1);self.nextthink = time + 0.08;};
void()	army_walk4	=[	$run4,	army_walk5	] {ai_walk(1);self.nextthink = time + 0.08;};
void()	army_walk5	=[	$run5,	army_walk6	] {ai_walk(2);self.nextthink = time + 0.08;};
void()	army_walk6	=[	$run6,	army_walk7	] {ai_walk(3);self.nextthink = time + 0.08;};
void()	army_walk7	=[	$run7,	army_walk8	] {ai_walk(4);self.nextthink = time + 0.08;};
void()	army_walk8	=[	$run8,	army_walk9	] {ai_walk(4);self.nextthink = time + 0.08;};
void()	army_walk9	=[	$run9,	army_walk10	] {ai_walk(2);self.nextthink = time + 0.08;};
void()	army_walk10	=[	$run10,	army_walk11	] {ai_walk(2);self.nextthink = time + 0.08;};
void()	army_walk11	=[	$run11,	army_walk12	] {ai_walk(2);self.nextthink = time + 0.08;};
void()	army_walk12	=[	$run12,	army_walk13	] {ai_walk(1);self.nextthink = time + 0.08;};
void()	army_walk13	=[	$run13,	army_walk14	] {ai_walk(0);self.nextthink = time + 0.08;};
void()	army_walk14	=[	$run14,	army_walk15	] {ai_walk(1);self.nextthink = time + 0.08;};
void()	army_walk15	=[	$run15,	army_walk16	] {ai_walk(1);self.nextthink = time + 0.08;};
void()	army_walk16	=[	$run16,	army_walk17	] {ai_walk(1);self.nextthink = time + 0.08;};
void()	army_walk17	=[	$run17,	army_walk18	] {ai_walk(3);self.nextthink = time + 0.08;};
void()	army_walk18	=[	$run18,	army_walk19	] {ai_walk(3);self.nextthink = time + 0.08;};
void()	army_walk19	=[	$run19,	army_walk20	] {ai_walk(3);self.nextthink = time + 0.08;};
void()	army_walk20	=[	$run20,	army_walk21	] {ai_walk(3);self.nextthink = time + 0.08;};
void()	army_walk21	=[	$run21,	army_walk22	] {ai_walk(2);self.nextthink = time + 0.08;};
void()	army_walk22	=[	$run22,	army_walk23	] {ai_walk(1);self.nextthink = time + 0.08;};
void()	army_walk23	=[	$run23,	army_walk24	] {ai_walk(1);self.nextthink = time + 0.08;};
void()	army_walk24	=[	$run24,	army_walk25	] {ai_walk(1);self.nextthink = time + 0.08;};
void()	army_walk25	=[	$run25,	army_walk26	] {ai_walk(1);self.nextthink = time + 0.08;};
void()	army_walk26	=[	$run26,	army_walk27	] {ai_walk(1);self.nextthink = time + 0.08;};
void()	army_walk27	=[	$run27,	army_walk28	] {ai_walk(1);self.nextthink = time + 0.08;};
void()	army_walk28	=[	$run28,	army_walk29	] {ai_walk(1);self.nextthink = time + 0.08;};
void()	army_walk29	=[	$run29,	army_walk30	] {ai_walk(1);self.nextthink = time + 0.08;};
void()	army_walk30	=[	$run30,	army_walk1	] {ai_walk(1);self.nextthink = time + 0.08;};

void()	army_run1	=[	$run1,	army_run2	] {ai_run(15);self.nextthink = time + 0.08;};
void()	army_run2	=[	$run2,	army_run3	] {ai_run(10);self.nextthink = time + 0.08;};
void()	army_run3	=[	$run3,	army_run4	] {ai_run(8);self.nextthink = time + 0.08;};
void()	army_run4	=[	$run4,	army_run5	] {ai_run(8);self.nextthink = time + 0.08;};
void()	army_run5	=[	$run5,	army_run6	] {ai_run(15);self.nextthink = time + 0.08;};
void()	army_run6	=[	$run6,	army_run7	] {ai_run(10);self.nextthink = time + 0.08;};
void()	army_run7	=[	$run7,	army_run8	] {ai_run(8);self.nextthink = time + 0.08;};
void()	army_run8	=[	$run8,	army_run9	] {ai_run(8);self.nextthink = time + 0.08;};
void()	army_run9	=[	$run9,	army_run10	] {ai_run(8);self.nextthink = time + 0.08;};
void()	army_run10	=[	$run10,	army_run11	] {ai_run(8);self.nextthink = time + 0.08;};
void()	army_run11	=[	$run11,	army_run12	] {ai_run(8);self.nextthink = time + 0.08;};
void()	army_run12	=[	$run12,	army_run13	] {ai_run(15);self.nextthink = time + 0.08;};
void()	army_run13	=[	$run13,	army_run14	] {ai_run(10);self.nextthink = time + 0.08;};
void()	army_run14	=[	$run14,	army_run15	] {ai_run(10);self.nextthink = time + 0.08;};
void()	army_run15	=[	$run15,	army_run16	] {ai_run(10);self.nextthink = time + 0.08;};
void()	army_run16	=[	$run16,	army_run17	] {ai_run(8);self.nextthink = time + 0.08;};
void()	army_run17	=[	$run17,	army_run18	] {ai_run(8);self.nextthink = time + 0.08;};
void()	army_run18	=[	$run18,	army_run19	] {ai_run(8);self.nextthink = time + 0.08;};
void()	army_run19	=[	$run19,	army_run20	] {ai_run(8);self.nextthink = time + 0.08;};
void()	army_run20	=[	$run20,	army_run21	] {ai_run(8);self.nextthink = time + 0.08;};
void()	army_run21	=[	$run21,	army_run22	] {ai_run(8);self.nextthink = time + 0.08;};
void()	army_run22	=[	$run22,	army_run23	] {ai_run(8);self.nextthink = time + 0.08;};
void()	army_run23	=[	$run23,	army_run24	] {ai_run(8);self.nextthink = time + 0.08;};
void()	army_run24	=[	$run24,	army_run25	] {ai_run(8);self.nextthink = time + 0.08;};
void()	army_run25	=[	$run25,	army_run26	] {ai_run(8);self.nextthink = time + 0.08;};
void()	army_run26	=[	$run26,	army_run27	] {ai_run(8);self.nextthink = time + 0.08;};
void()	army_run27	=[	$run27,	army_run28	] {ai_run(8);self.nextthink = time + 0.08;};
void()	army_run28	=[	$run28,	army_run29	] {ai_run(8);self.nextthink = time + 0.08;};
void()	army_run29	=[	$run29,	army_run30	] {ai_run(8);self.nextthink = time + 0.08;};
void()	army_run30	=[	$run30,	army_run1	] {ai_run(8);self.nextthink = time + 0.08;};


void()	army_atk1	=[	$shoot1,	army_atk2	] {ai_face();self.nextthink = time + 0.08;};
void()	army_atk2	=[	$shoot2,	army_atk3	] {ai_face();self.nextthink = time + 0.08;};
void()	army_atk3	=[	$shoot3,	army_atk4	] {ai_face();self.nextthink = time + 0.08;};
void()	army_atk4	=[	$shoot4,	army_atk5	] {ai_face();self.nextthink = time + 0.08;};
void()	army_atk5	=[	$shoot5,	army_atk6	] {ai_face();army_fire();
self.effects = self.effects | EF_MUZZLEFLASH;self.nextthink = time + 0.08;};
void()	army_atk6	=[	$shoot6,	army_atk7	] {ai_face();self.nextthink = time + 0.08;};
void()	army_atk7	=[	$shoot7,	army_atk8	] {ai_face();SUB_CheckRefire (army_atk1);self.nextthink = time + 0.08;};
void()	army_atk8	=[	$shoot8,	army_atk9	] {ai_face();self.nextthink = time + 0.08;};
void()	army_atk9	=[	$shoot9,	army_run1	] {ai_face();self.nextthink = time + 0.08;};

void()	army_pain1	=[	$hit1,		army_pain2	] {self.nextthink = time + 0.08;};
void()	army_pain2	=[	$hit2,		army_pain3	] {self.nextthink = time + 0.08;};
void()	army_pain3	=[	$hit3,		army_pain4	] {self.nextthink = time + 0.08;};
void()	army_pain4	=[	$hit4,		army_pain5	] {self.nextthink = time + 0.08;};
void()	army_pain5	=[	$hit5,		army_pain6	] {self.nextthink = time + 0.08;};
void()	army_pain6	=[	$hit6,		army_run1	] {ai_pain(1);self.nextthink = time + 0.08;};

void(entity attacker, float damage)	army_pain =
{
	local float r;
	
	if (self.pain_finished > time)
		return;

	self.pain_finished = time + 0.6;
	army_pain1 ();
	sound (self, CHAN_VOICE, "soldier/pain1.wav", 1, ATTN_NORM);
};


void() army_fire =
{
	local	vector	dir;
	local	entity	en;
	
	ai_face();
	
	sound (self, CHAN_WEAPON, "soldier/sattck1.wav", 1, ATTN_NORM);	

// fire somewhat behind the player, so a dodging player is harder to hit
	en = self.enemy;
	
	dir = en.origin - en.velocity*0.2;
	dir = normalize (dir - self.origin);
	
	FireBullets (4, dir, '0.1 0.1 0');
};



void()	army_die1	=[	$death1,	army_die2	] {self.nextthink = time + 0.04;};
void()	army_die2	=[	$death2,	army_die3	] {self.nextthink = time + 0.04;};
void()	army_die3	=[	$death3,	army_die4	]
{self.solid = SOLID_NOT;self.ammo_shells = 5;self.nextthink = time + 0.04;};
void()	army_die4	=[	$death4,	army_die5	] {self.nextthink = time + 0.04;};
void()	army_die5	=[	$death5,	army_die6	] {self.nextthink = time + 0.04;};
void()	army_die6	=[	$death6,	army_die7	] {self.nextthink = time + 0.04;};
void()	army_die7	=[	$death7,	army_die8	] {self.nextthink = time + 0.04;};
void()	army_die8	=[	$death8,	army_die9	] {self.nextthink = time + 0.04;};
void()	army_die9	=[	$death9,	army_die10	] {self.nextthink = time + 0.04;};
void()	army_die10	=[	$death10,	army_die11	] {self.nextthink = time + 0.04;};
void()	army_die11	=[	$death11,	army_die12	] {self.nextthink = time + 0.04;};
void()	army_die12	=[	$death12,	army_die13	] {self.nextthink = time + 0.04;};
void()	army_die13	=[	$death13,	army_die14	] {self.nextthink = time + 0.04;};
void()	army_die14	=[	$death14,	army_die15	] {self.nextthink = time + 0.04;};
void()	army_die15	=[	$death15,	army_die16	] {self.nextthink = time + 0.04;};
void()	army_die16	=[	$death16,	army_die17	] {self.nextthink = time + 0.04;};
void()	army_die17	=[	$death17,	army_die18	] {self.nextthink = time + 0.04;};
void()	army_die18	=[	$death18,	army_die19	] {self.nextthink = time + 0.04;};
void()	army_die19	=[	$death19,	army_die20	] {self.nextthink = time + 0.04;};
void()	army_die20	=[	$death20,	army_die21	] {self.nextthink = time + 0.04;};
void()	army_die21	=[	$death21,	army_die22	] {self.nextthink = time + 0.04;};
void()	army_die22	=[	$death22,	army_die23	] {self.nextthink = time + 0.04;};
void()	army_die23	=[	$death23,	army_die24	] {self.nextthink = time + 0.04;};
void()	army_die24	=[	$death24,	army_die25	] {self.nextthink = time + 0.04;};
void()	army_die25	=[	$death25,	army_die26	] {self.nextthink = time + 0.04;};
void()	army_die26	=[	$death26,	army_die27	] {self.nextthink = time + 0.04;};
void()	army_die27	=[	$death27,	army_die28	] {self.nextthink = time + 0.04;};
void()	army_die28	=[	$death28,	army_die29	] {self.nextthink = time + 0.04;};
void()	army_die29	=[	$death29,	army_die30	] {self.nextthink = time + 0.04;};
void()	army_die30	=[	$death30,	army_die30	] {self.nextthink = time + 0.04;};


void() army_die =
{
// check for gib
	if (self.health < -35)
	{
		sound (self, CHAN_VOICE, "player/udeath.wav", 1, ATTN_NORM);
		ThrowHead ("progs/gib1.mdl", self.health);
		ThrowGib ("progs/gib3.mdl", self.health);
		ThrowGib ("progs/gib1.mdl", self.health);
		ThrowGib ("progs/gib2.mdl", self.health);
		ThrowGib ("progs/gib3.mdl", self.health);
		ThrowGib ("progs/gib2.mdl", self.health);
		return;
	}

	sound (self, CHAN_VOICE, "soldier/death1.wav", 1, ATTN_NORM);
	army_die1 ();
};


/*QUAKED monster_army (1 0 0) (-16 -16 -24) (16 16 40) Ambush
*/
void() monster_army =
{	
	if (deathmatch)
	{
		remove(self);
		return;
	}
	precache_model ("enemies/gunner.mdl");
	precache_model ("progs/gib1.mdl");
	precache_model ("progs/gib2.mdl");
	precache_model ("progs/gib3.mdl");

	precache_sound ("soldier/death1.wav");
	precache_sound ("soldier/idle.wav");
	precache_sound ("soldier/pain1.wav");
	precache_sound ("soldier/pain2.wav");
	precache_sound ("soldier/sattck1.wav");
	precache_sound ("soldier/sight1.wav");

	precache_sound ("player/udeath.wav");		// gib death


	self.solid = SOLID_SLIDEBOX;
	self.movetype = MOVETYPE_STEP;

	setmodel (self, "enemies/gunner.mdl");
	setsize (self, '-16 -16 -24', '16 16 40');
	//setorigin (self, self.origin + '0 16 0');
	self.health = 30;

	self.th_stand = army_stand1;
	self.th_walk = army_walk1;
	self.th_run = army_run1;
	self.th_missile = army_atk1;
	self.th_pain = army_pain;
	self.th_die = army_die;

	walkmonster_start ();
};
