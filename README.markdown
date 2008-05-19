# Doodle
Doodle is an experiment, a game that aims to provide a fun audiovisual experience instead of innovative gameplay. It is free and open source software, based on Quake 1 source-code and the NPRQuake project by Alex Mohr. We spent a lot of time adapting, fixing and improving the GLQuake engine, but there's still a lot to do.

## Authors and contributors
* [Klaus Silveira](http://www.klaussilveira.com) (Creator, developer)
* Paweł Chrapka (Level designer)
* Alex Mohr (NPRQuake renderer)

## Special thanks
* John Carmack and id Software for kicking ass all those years
* Alex Mohr for his work on NPRQuake
* QuakeSrc.org for everything, R.I.P
* mh for his great knowledge of the Quake engine and not keeping that for himself

## Todo
Well, there's a lot to do, including a better todo list. I'm also working on a roadmap, but i wanted to focus on fixing bugs and getting the engine stable.

### Engine
* Fix bug when automatically loading the sketch renderer (strange texture flickering)
* Fix map size limit bug
* Fix weapon projectile origin and angle
* Port to Linux
* Once ported to Linux, get rid of Visual Studio
* Support for transparent PNGs and/or TGAs for better sprites (both in-game and menu)
* Everytime a weapon is shot, an sprite like s_explod.spr should appear. Later we'll create the "ra ta ta ta" effect.
* Everytime an enemy is hit, an sprite like s_explod.spr should appear. Later we'll create the "Pow!" and other effects.

### Art
* Create an animal enemy, in order to replace the Quake dog
* Create more soldier-esque enemies
* Create flying enemies
* Create a boss

### Sounds
* Sound effects in Doodle should be made with your mouth, as much ridiculous and funny as possible. 
* Create sound effects for all weapons
* Create sound effects for player
* Create sound effects for menus
