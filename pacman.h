// Some variables that you may want to change
#ifndef DATAROOTDIR
#	define DATAROOTDIR "/usr/local/share"
#endif
#define LEVELS_FILE DATAROOTDIR "/pacman/Levels/level__.dat"
char LevelFile[] = LEVELS_FILE;		//Locations of default levels
int FreeLife = 1000;			//Starting points for free life
int Points = 0;				//Initial points
int Lives = 5;				//Number of lives you start with
int HowSlow = 3;			//How slow vulnerable ghost move
int SpeedOfGame = 275000000;		//How much of a delay is in the game
