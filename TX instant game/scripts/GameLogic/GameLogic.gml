
function SetAvailableLetters(){
	global.idLetters = -1;
	if(global.lettersCount == 3)
	{
		layer_create(-300, "bottomLetters")
		letterId_1 = instance_create_layer(global.threeLettersPosX_1,global.threeLettersPosY_1,
		"bottomLetters",obj_letterHolder);
		letterId_1.InitializeLetter(global.letter_1);

		letterId_2 = instance_create_layer(global.threeLettersPosX_2,global.threeLettersPosY_2,
		"bottomLetters",obj_letterHolder);
		letterId_2.InitializeLetter(global.letter_2);
	
		letterId_3 = instance_create_layer(global.threeLettersPosX_3,global.threeLettersPosY_3,
		"bottomLetters",obj_letterHolder);
		letterId_3.InitializeLetter(global.letter_3);
	}
}

function CreateCrossword(crosswordString) //     letters:ate;width:3;words:tea-012,ate-678,eat-147;knownWords:eat;
{
	json = "{\n   \"letters\":\"ate\",\n   \"width\":3,\n   \"height\":3,\n   \"words\":[\n      \"tea\",\n      \"ate\",\n      \"eat\"\n   ],\n   \"positions\":[\n      \"012\",\n      \"678\",\n      \"147\"\n   ],\n   \"knownWords\":[\n      \"eat\"\n   ]\n}"
	myInfo = json_parse(json);
	lettersInGame = myInfo.letters;
	global.letter_1 = string_char_at(lettersInGame,1);
	global.letter_2 = string_char_at(lettersInGame,2);
	global.letter_3 = string_char_at(lettersInGame,3);
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
	global.puzzleWords = myInfo.words;
	global.puzzleWordPosition = myInfo.positions;
	global.unknownWords = ds_list_create();
	
	layer_create(-300, "crossword")
	
	refernceBox = instance_create_layer(0,0, "crossword", obj_crosswordEmpty);
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
			box = instance_create_layer(posX, posY, "crossword", obj_crosswordEmpty);
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
		for ( i= 0; i < array_length(myInfo.words); i++) // tea
		{
			isKnownWord = false;
			for ( k=0; k< array_length(myInfo.knownWords); k++)
			{
				if(myInfo.knownWords[k] == myInfo.words[i])
				{
					isKnownWord=true;
					break;
				}
			}
			if(!isKnownWord)
			{
				ds_list_add(global.unknownWords, myInfo.words[i]);
			}
			for ( j= 1; j <= string_length(myInfo.positions[i]); j++) // 0,1,2
			{
				index = string_char_at(myInfo.positions[i],j);
				allBoxes[index].SetLetter(string_char_at(myInfo.words[i],j),isKnownWord);
			}
		}
	}
	else
	{
		// for more than width = 6 
	}
	global.allBoxes = allBoxes;
}

function CheckForWord(word)
{
	for ( i=0; i< ds_list_size(global.unknownWords); i++)
	{
		if(global.unknownWords[| i] == word)
		{
		//	show_debug_message("global.unknownWords[| i] = "); 
		//	show_debug_message(global.unknownWords[| i]);
		//	show_debug_message("word = "); 
		//	show_debug_message(word);
			RevealWord(word);
			return;
		}
	}
	WrongWord(word);
}

function RevealWord(word)
{
	for ( i=0; i< array_length(global.puzzleWords); i++)
	{
		if(global.puzzleWords[i] == word)
		{
			//show_debug_message("global.puzzleWordPosition[i]: ");
			//show_debug_message(global.puzzleWordPosition[i]);
			for ( j=1; j <= string_length(global.puzzleWordPosition[i]); j++)
			{
				//show_debug_message("string_length: ");
				//show_debug_message(global.puzzleWordPosition[i]);
				global.allBoxes[string_char_at(global.puzzleWordPosition[i],j)].RevealLetter();
			}
		}
	}
}

function WrongWord(word)
{
	show_debug_message("THIS WORD IS ALREADY KNOWN OR WRONG: ");
	show_debug_message(word);
}