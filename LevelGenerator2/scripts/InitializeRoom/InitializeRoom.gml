///@description Initialize our room
randomize();

gridSize = 16; //Size of blocks/objects
xSections = 4; //Sections along the x-axis 
ySections = 4; //Sections along the y-axis
sections = []; //Sectionss array

sectionTilesX = 30; //Width of a section
sectionTilesY = 14; //Height of a section

sectionWidth = sectionTilesX * gridSize; //Width of a section in pixels
sectionHeight = sectionTilesY * gridSize; //Height of a section in pixels

room_width = (sectionWidth * xSections) + (gridSize * 2); //width of the whole room
room_height = (sectionHeight * ySections) + (gridSize * 2); //Height of the whole room

for (_y = 0; _y < ySections; _y++) //Creates the grid
{
	for (_x = 0; _x < xSections; _x++)
	{
	sections[_x, _y] = 0;
	}
}

//Create Main Path
CreateMainPath();

//Writes out the room in console
for (_y = 0; _y < ySections; _y++)
{
	show_debug_message(string(sections[0, _y]) + string(sections[1, _y]) + string(sections[2, _y]) + string(sections[3, _y]));
}
//Initiaalizing Sections (loading sections as strings into memory)
InitializeAllSections();
// Create the level
GenerateLevel();
// Clean (DeInitialize the sections from the memory)
ds_list_destroy(sectionLeftBottomRightList);
ds_list_destroy(sectionLeftRightList);
ds_list_destroy(sectionLeftTopRightList);
