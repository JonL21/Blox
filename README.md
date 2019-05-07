# Blox
A Tetris clone made in GameMaker Studio 2 (imported from GameMaker Studio 1).

## Features
* SRS Rotation System
* Classic Game Modes:
	* Marathon - clear 150 lines as fast as possible
	* Ultra - get as much points possible in 3 minutes
	* Sprint - clear 40 lines as fast as possible
* Animations!

## Changelog
### May 6, 2019
* Added Classic Game Modes
* Improved Pause Menu
	* Doubles as game over menu, showing final score and time
	* Now pauses when window becomes out of focus
* Cleaned up UI
	* Refactored most of hard-coded text positions
	* Added countdown before game starts
* Improved Lockdown System
	* Lock cancels, lock delay
* Other Improvements
	* Statistics now stored in a map to allow for extensibility
	* Cleaned up score calculating code
	* Removed unused debug room

### May 5, 2019
* Revamped collision system and rotation system
	* Collision system now considers position of each tile of block rather than origin of block
	* Rotation system now properly adheres to kick translations of SRS

### May 4, 2019
* Implemeted improved callout system
	* Object that handles how combo/line clear callouts are handled
* Several improvements
	* Further adjustment of order of block-placing script processing
* Remove older callout system

### May 2, 2019
* Adjust order of script processing after a block is placed
	* Line clear animation temporarily disabled
* Adjusted T-Spin checking logic
* Added nonfunctional game over logic
* Introduction of different display of line clears

## To-Do
* Add some backgrounds
* Sounds
* Options Menu
	* Edit Keybinds
	* Edit Gameplay elements?
	* Show/Hide Statistics 
* High Scores Leadboard/Database
* Proper commenting of code
* Refactoring of code
* Remove dependency on compatability scripts