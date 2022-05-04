# CHANGELOG

All notable changes to this project will be documented in this file.
## [0.6] - 2022-05-03 - 
## [0.5] - 2022-04-30 - Created a GUI class for dynamic in-game settings UI 
 - A GUI displays global variables and changes are stores into an ini array for saving/loading
 - App can now write to settings.ini when settings change in gui.
 - App can now read from ini and set user-configuraton to in-app settings.
 - App can dynamically produce a settings gui from an associative array
 - Added a menu feature to have buttons to open gui's to edit each setting group
 - The menu now has a graphical background.
 - Added graphical assets for the panels.
 - Added a GDI wrapper to add some flexability to the GUI.
 - Created a dynamic HotKey class to manage hotkeys.
 - Added a meta-data layer to hotkeys to work with certain states 
 - Added HotKey metadata to the debug Gui 
 - Fixed Gestures for more reliable actions
 - Has auto-lock that can be enabled on some keys see hotKeyMetaData.ahk for now.
 - Can toggle HotKey on and off when accessing menus CTRL-ALT-SHIFT-q
 - Can open config menu CTRL-ALT-SHIFT-A
 - Can toggle AutoLock on/off CTRL-ALT-SHIFT-S
 - Auto Lock can be locked pressing the same key twice before it times out.
 - Auto lock will release after one press to throw/cast after 2000 ms 
 - Can define which key will auto-lock in the defaultHotKeys.ahk files (not in game yet) 

## [0.4] - 2022-04-26 - Overhaul of coding structure to files and bug fixes
- Updated Nomaclature for easier to recognize variables, subroutines etc.
- Organized all code components to relative named Files 
- Created debug GUI for slot timing CTRL-SHIFT-D to display
- Fixed several timing issues causing slot position to fail.
- Can still trigger if spamming spell/belt slots ouside of iframes but seems solid when not spamming keys.
- User settings now in sepparate files so future updates won't require need to always update until an in-game
  settings gui can be developed.

## [0.3] - 2022-04-25 - Re-organizing code towards functions.
 - Added an auto-run feature.
 - Can now toggle between left/right armements for spell casting.
 - Can define the number of belt/spell slots with a quick UI in game.
 - More GUI aware with timers.
 - Piped belt/slot events through functions for better code management and debugging.

## [0.2] - 2022-04-23 - Scoped out variables for HotKeys
- Settings moved to top of file for easy configuration
- Jump+Dual Weild
- Implementing variables for future custom configurations.


## [0.1] - 2022-04-22 - Preliminary Development 
- Testing AutoHotKey and ergonomic keyboard / mouse through extending an existing working script
- added a set of combos to test actions.
- Parry+Light Attack
- Crouch+Attack
- Jump+Attack
- Jump+Strong Attack
