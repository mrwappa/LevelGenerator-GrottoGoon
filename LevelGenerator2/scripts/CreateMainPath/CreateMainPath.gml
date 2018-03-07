// Select Starting Room
var currentY = 0; //Start y)
var currentX = choose( 1, 2,); //DONT FUCKING FORGET TO CHANGE THIS SHIT WHEN CHANGING GRIDSIZE(Start x)
var newDirection = 0; //Keeps track of directions (1,2,3)

sections[currentX, currentY] = 1; //StartingSection 

while (currentY < 4) //GRIDSIZE AGAIN DUDE
{
	if (newDirection == 0)
		newDirection = choose(1, 2); //Randomize a new direction 
	
	
	//Move left (1)
	if (newDirection == 1) 
	{
		if (currentX > 0) //Checks if at border
		{
			sections [--currentX, currentY] = 1;
			newDirection = choose(1, 1, 3);
		}
		else
		{
			//Cant move left, need to move down
			if (currentY < 3) //Checks if at bottom
			{
				sections[currentX, currentY] = 2; //Hole in bottom
				sections[currentX, ++currentY] = 3; //Hole in roof
				newDirection = 2;
			}
			else
			{
				++currentY; //Exit loop
			}
		}
	}
	//Move right (2)
	else if (newDirection == 2)
	{
		if (currentX < 3) //Checks if at border 
		{
			sections [++currentX, currentY] = 1;
			newDirection = choose(2, 2, 3);
		}
		else
		{
			//Cant move right, need to move down
			if (currentY < 3) //Checks if at bottom
			{
				sections[currentX, currentY] = 2; 
				sections[currentX, ++currentY] = 3;
				newDirection = 1;
			}
			else
			{
				++currentY; //Exit loop
			}
		}
	
	}
	//Move down (3)
	else if (newDirection == 3)
	{
		if (currentY < 3)
		{
				sections[currentX, currentY] = 2; 
				sections[currentX, ++currentY] = 3;
				newDirection = 0;
				
				if(currentX == xSections - 1) //Cant move to direction of border after going down
				     {
					 newDirection = 1; //rightBorder
					 }
				else if (currentX == 0)
					{
					newDirection = 2; //leftBorder
					}
		}
		else 
		{
			++currentY; //at bottom 
		}
		
	}
}