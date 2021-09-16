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

function CreateCrossword(crosswordString) //     letters:ate;width:3;words:tea-012,ate-678,eat-147;knownWords:eat;
{
	json = "{\n   \"letters\":\"ate\",\n   \"width\":3,\n   \"height\":3,\n   \"words\":[\n      \"tea\",\n      \"ate\",\n      \"eat\"\n   ],\n   \"positions\":[\n      \"012\",\n      \"678\",\n      \"147\"\n   ],\n   \"knownWords\":[\n      \"eat\"\n   ]\n}"
	myInfo = json_parse(json);
	lettersInGame = myInfo.letters;
	width = myInfo.width;
	height = myInfo.height;
	for ( i=0; i< array_length(myInfo.words); i++)
	{
		show_debug_message(myInfo.words[i]);
	}
	for ( i=0; i< array_length(myInfo.positions); i++)
	{
		show_debug_message(myInfo.positions[i]);
	}
	for ( i=0; i< array_length(myInfo.knownWords); i++)
	{
		show_debug_message(myInfo.knownWords[i]);
	}
	refernceBox = instance_create_layer(0,0, "letters", obj_crosswordEmpty);
	allBoxes = array_create(width * height);
	if(width < 6)
	{
		centerOfScreen = (room_width/2) + (refernceBox.sprite_width/2);
		startX = centerOfScreen - (refernceBox.sprite_width * (width/2));
		posX = startX;
		posY = room_height / 8;
		instance_destroy(refernceBox);
		for(i=0; i < width * height; i++)
		{
			box = instance_create_layer(posX, posY, "letters", obj_crosswordEmpty);
			allBoxes[i] = box;
			box.image_alpha = 0;
			if( (i+1) % width == 0)
			{
				posX = startX;
				posY += box.sprite_height;
			}
			else
			{
				posX += box.sprite_width; 
			}
		}
		for ( i=0; i< array_length(myInfo.words); i++)
		{
			for ( j= 0; j < string_length(myInfo.positions[i]); j++)
			{
				allBoxes[j].SetLetter(string_char_at(myInfo.words[i],j));
			}
		}
	}
	else
	{
		crosswordWidth = endX - startX;
	
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
		}
	}
}