# Elden Ring Ergonomic Keyboard and Mouse Overhaul

This project is scoped to make mouse and keyboard game play more ergonomic and useful for 
Elden Ring. It is designed to  reduce gaming fatigue for people who like ergonomic gameplay 
centered around preventing reaching, stretching or cramping.  Although this will work for 
any style of keyboard/mouse bindings that suit your style of game play.

This tool is licenced under GPLv3.

## Discord <https://discord.com/invite/QPNtvGU>
My discord channel.

## Demonstration
<https://www.youtube.com/watch?v=vtW3hkSzEDg>

## Nexus Mod <https://www.nexusmods.com/eldenring/mods/851>
The main Nexus Mod page.

## Requirements <https://www.autohotkey.com/> 
Written for Version 1.133.11 of AutoHotKey

No executable will be provided in this package.  You can compile your own executable using
AutoHotKey once it's installed by right-clicking on EldenRing.ahk and choosing compole or
use Run-Script to launch the app.

## Setup
Currently all settings are manually configured in the main EldenRingHK.ahk so you will have
to edit the key bindings manually until I can provide GUI which is scoped for later versions.

It is recommended to run in Boderless-Window mode.  If you do compile the script as an 
autohotkey executable, you can modify admin level privilages and priority on the Process
to help preformance.  Preformance will be less optimal as a script which is noted by 
input-latency between the app and the Elden Ring game client.  

## Features v0.3

Movement
- Auto-Run

Attack Combos (1 action key press)
- Parry+Light Attack
- Crouch+Attack
- Jump+Attack
- Jump+Strong Attack
- Jump+Dual Weild

Spells
- One key spell navigation and activation
- Toggle between left and right armement for spell casting.
- Match current available spell slots.
- Limit spell slots to priority group.

Belt
- One key belt navigation and activation
- Limit belt slots to priority group

Gestures
- One key gestures

The goal is not to provide a cheat interface rather functions that can reduce the number
of keys and repeat keys for actions to reduce hand fatigue for the player making the 
keyboard and mouse gaming community more accessable to a console/controller focused game design.

## Ergonomic Keybinding 
The KeyInfo.xlsx Excel sheet shows ergonomic keyboard bindings and multi-button mouse settings.
The focus of ergonomic game play is to prioritize finger placement in the standard Qwerty typing.
The main action keys are centered around:

QWER
ASDF   <-----> Multi-Button mouse
ZXCV

The more your fingers have to stretch, reach or cramp should lessing the key's value in terms
of priority for the keybinding and action it preforms.  Most used actions should try to fit
within the 12 Qwerty key arrangment, then lesser actions can become varients of SHIFT, CTRL, ALT. 

As a rule, if you have to stretch your fingers then give that key a lesser priority for a lesser
used action.  SHIFT-F for example stretches the fingers, still in a usable zone but not as 
ergonomically friendly as just 'F'.  If  you have to reach (hand leaves the Qwerty placement ) 
those reach key zones should be left to non-action keys like menu navigation.  The less you have 
to cramp/stretch you will have less gaming fatigue on your hands.  If you have to reach during 
action like combat likely that can throw your Qwerty placement off resulting in wrong key presses.

Having forward/back movement bound to the side thumb mouse-buttons if your mouse supports it
can be very ergonomically friendly as the right thumb rests nicely on the side of the mouse
freeing the left hand to focus on action keys for combat.  It also frees the left hand to 
reach for a beer while still navigating a game if some combat mouse buttons are bound.

## Troubleshooting 
As more information comes in I'll update a troubleshooting guide.  For now follow the standard
rules for AutoHotKey and a good guide for trouble shooting can be found here.
<https://www.autohotkey.com/board/topic/111737-how-to-make-ahk-work-in-most-games-the-basics/>

## Credits
I started with a base-line script produced by Olaf Krahl "Gooru" that already had auto-belt/auto-spell/auto-gesture 
features and have overhauled this to extend towards ergonomic gameplay and other features.

You can find his original script for AutoHotKey here and all credits for the Auto-Belt/Auto-Spell/Auto-Gestures
goes towards him.  
<https://steamlists.com/elden-ring-script-for-autohotkey-for-mouse-keyboard/?msclkid=391ff484c21f11ec8b7f40c06c9be788>

## Github <https://github.com/YouAreDreaming/EldenRingAHK>
Feel free to fork/contribute and add to this script.  My goal is to simply provide a user-friendly
solution to keyboard and mouse players to improve their Elden Ring game-play experience and
expand on my coding skills as this is my first AutoHotKey App project.

## Licence

This repo is licenced under GPLv3

1. Anyone can copy, modify and distribute this software.
2. You have to include the license and copyright notice with each and every distribution.
3. You can use this software privately.
4. You can use this software for commercial purposes.
5. Any modifications of this code base MUST be distributed with the same license, GPLv3.
6. This software is provided without warranty.
7. The software author or license can not be held liable for any damages inflicted by the software.

Violations of the licence may make you liable for DMCA takedowns.





