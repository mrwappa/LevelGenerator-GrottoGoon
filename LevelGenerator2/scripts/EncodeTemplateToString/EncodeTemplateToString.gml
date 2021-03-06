gridSize = 16;

xTiles = room_width / gridSize;
yTiles = room_height / gridSize;

var levelData = "";

for	(_y = 0; _y < yTiles; _y++)
	for (_x = 0; _x < xTiles; _x++)
	{
		inst = instance_position(_x * gridSize, _y * gridSize, all);
		
		if (inst != noone)
			inst = inst.object_index;
			
		switch (inst)
		{
			case noone:
				levelData += "0";
				break;
			case obj_Wall:
				levelData += "1";
				break;
		}
	}
	
//show_message(levelData);

saveDir  = get_save_filename("*.txt", room_get_name(room) + ".txt");

file = file_text_open_write(saveDir);
file_text_write_string(file, levelData);
file_text_close(file);