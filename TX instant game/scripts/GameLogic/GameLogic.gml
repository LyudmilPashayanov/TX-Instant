// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function StartGame(){
	global.idLetters = -1;
	if(global.lettersCount == 3)
	{
		layer_create(-300, "letters")
		letterId_1 = instance_create_layer(global.threeLettersPosX_1,global.threeLettersPosY_1,
		"letters",obj_letterHolder);
		letterId_1.InitializeLetter(global.letter_1);

		letterId_2 = instance_create_layer(global.threeLettersPosX_2,global.threeLettersPosY_2,
		"letters",obj_letterHolder);
		letterId_2.InitializeLetter(global.letter_2);
	
		letterId_3 = instance_create_layer(global.threeLettersPosX_3,global.threeLettersPosY_3,
		"letters",obj_letterHolder);
		letterId_3.InitializeLetter(global.letter_3);
	}
}

function CreateCrossword(crosswordString) //         --C?T?--/--A-A---/-STAC---
{
	crosswordString = "???C?T???/?--A-A---/?-STAC---";
	startX = room_width/10;
	endX = room_width - startX;
	crosswordWidth = endX - startX;
	for ( i=1; i<=string_length(crosswordString); i++)
	{
		char = string_char_at(crosswordString,i);
		if(char == "/")
		{
			endOfLine = i - 1;
			show_debug_message("IN");
			break;
		}		
	}
	neededLetterSize = crosswordWidth / endOfLine;
	
	posX = startX + (neededLetterSize /2);
	posY = room_height / 8;
	for ( i=1; i<=string_length(crosswordString); i++)
	{
		char = string_char_at(crosswordString,i);
		endOfLine=false;
		if(char == "/")
		{
			endOfLine = true;
		}
		else if(char != "-")
		{
			box = instance_create_layer(posX,posY, "letters", obj_crosswordEmpty);
			scale = ((box.sprite_width - neededLetterSize) / box.sprite_width) * 100;
			
			box.image_xscale -= (scale/100);
			box.image_yscale -= (scale/100);

			if(char == "?")
			{
				box.SetLetter(" ");
			}	
			else  // it is a letter
			{
				box.SetLetter(string_char_at(crosswordString,i));
			}
		}
		
		posX += neededLetterSize;
		if(endOfLine)
		{
			posX = startX + (neededLetterSize/2);
			posY += neededLetterSize;
		}
	}
}