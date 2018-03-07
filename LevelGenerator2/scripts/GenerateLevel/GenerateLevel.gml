///Creates Outline for the room
for (_i = 0; _i < room_width; _i += gridSize)
{
	instance_create_layer(_i, 0, "Instances", obj_Wall);
	instance_create_layer(_i, room_height - gridSize, "Instances", obj_Wall);
}

for (_i = gridSize; _i < room_height - gridSize; _i += gridSize)
{
	instance_create_layer(0, _i, "Instances", obj_Wall);
	instance_create_layer(room_width - gridSize, _i, "Instances", obj_Wall);
}

//Creataes new section
var sectionStringData = ""; 

for (_y = 0; _y < ySections; _y++)
{
	for (_x = 0; _x < xSections; _x++)
	{
		sectionStringData = LoadRandomSection(sections[_x, _y]); 
		
		CreateSectionFromString(_x, _y, sectionStringData); 
	}
}
