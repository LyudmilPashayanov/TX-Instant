
function DefineLayers()
{
	//global.futuraBoldFont = font_add("Futura-Bold-03.ttf", 55, true, true, 32, 128);
	layer_create(-300, "crossword")
	layer_create(-300, "bottomLetters")
	layer_create(-400, "swipeStripes")
}

function SetAvailableLetters(){
	if(global.lettersCount == 3)
	{
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
	else if(global.lettersCount == 4)
	{
		letterId_1 = instance_create_layer(global.fourLettersPosX_1,global.fourLettersPosY_1,
		"bottomLetters",obj_letterHolder);
		letterId_1.InitializeLetter(global.letter_1);

		letterId_2 = instance_create_layer(global.fourLettersPosX_2,global.fourLettersPosY_2,
		"bottomLetters",obj_letterHolder);
		letterId_2.InitializeLetter(global.letter_2);
	
		letterId_3 = instance_create_layer(global.fourLettersPosX_3,global.fourLettersPosY_3,
		"bottomLetters",obj_letterHolder);
		letterId_3.InitializeLetter(global.letter_3);
		
		letterId_4 = instance_create_layer(global.fourLettersPosX_4,global.fourLettersPosY_4,
		"bottomLetters",obj_letterHolder);
		letterId_4.InitializeLetter(global.letter_4);
	}
	show_debug_message("fourLettersPosX_4 fourLettersPosX_4 fourLettersPosX_4 fourLettersPosX_4 fourLettersPosX_4");

}

function DefineGlobalsFromJSON(json)
{
	global.letter_1 = string_upper(string_char_at(json.letters,1));
	global.letter_2 = string_upper(string_char_at(json.letters,2));
	global.letter_3 = string_upper(string_char_at(json.letters,3));
	if(string_length(json.letters) > 3)
	{
		global.letter_4 = string_upper(string_char_at(json.letters,4));
		if(string_length(json.letters) > 4)
		{
			global.letter_5 = string_upper(string_char_at(json.letters,5));
			if(string_length(json.letters) > 5)
			{
				global.letter_6 = string_upper(string_char_at(json.letters,6));
			}
		}
	}
	global.lettersCount = string_length(json.letters);
	global.puzzleWords = json.words;
	for ( i= 0; i < array_length(global.puzzleWords); i++) // tea  page
	{
		global.puzzleWords[i] = string_upper(global.puzzleWords[i]);
	}
	global.puzzleWordPosition = json.positions;
	global.knownWords = json.knownWords;
	for ( i= 0; i < array_length(global.knownWords); i++) // tea  page
	{
		global.knownWords[i] = string_upper(global.knownWords[i]);
	}
	global.unknownWords = ds_list_create();
}

function CreateCrossword(crosswordString) //     letters:ate;width:3;words:tea-012,ate-678,eat-147;knownWords:eat;
{
	json = "{\r\n   \"letters\":\"ate\",\r\n   \"width\":3,\r\n   \"height\":3,\r\n   \"words\":[\r\n      \"tea\",\r\n      \"ate\",\r\n      \"eat\"\r\n   ],\r\n   \"positions\":[\r\n      [0,1,2],\r\n      [6,7,8],\r\n      [1,4,7]\r\n   ],\r\n   \"knownWords\":[\r\n      \"ate\"\r\n   ]\r\n}"      
	//json = "{\r\n   \"letters\":\"nose\",\r\n   \"width\":5,\r\n   \"height\":4,\r\n   \"words\":[\r\n      \"son\",\r\n      \"one\",\r\n      \"nose\",\r\n\"ones\"\r\n   ],\r\n   \"positions\":[\r\n      [5,10,15],\r\n      [10,11,12],\r\n      [1,2,3,4],\r\n      [2,7,12,17] \r\n   ],\r\n   \"knownWords\":[]\r\n}"; //\"nose\",\"ones\",\"one\",\"son\"  
	//json = "{\r\n   \"letters\":\"passage\",\r\n   \"width\":11,\r\n   \"height\":8,\r\n   \"words\":[\r\n      \"page\",\r\n      \"apes\",\r\n      \"passage\",\r\n      \"pages\",\r\n     \"ages\",\r\n     \"gasps\",\r\n     \"sages\",\r\n       \"saga\",\r\n       \"age\",\r\n      \"seas\"\r\n   ],\r\n   \"positions\":[\r\n      [44,55,66,77],\r\n      [55,56,57,58],\r\n      [24,25,26,27,28,29,30],\r\n      [14,25,36,47,58],\r\n      [4,5,6,7],\r\n      [5,16,27,38,49],\r\n      [7,18,29,40,51],\r\n      [51,52,53,54],\r\n      [52,63,74],\r\n      [32,43,54,65]\r\n   ],\r\n   \"knownWords\":[]\r\n}";
	josnClass = json_parse(json);
	DefineGlobalsFromJSON(josnClass);
	width = josnClass.width;
	height = josnClass.height;
	scaleUp = (11 - width) / 10; // formula  percent showing how much to scale the crossword.
	if(scaleUp > 0.5)
	{
		scaleUp = 0.5; // maximum larged boxes
	}
	referenceBox = instance_create_layer(0,0, "crossword", obj_crosswordEmpty);
	referenceBox.image_xscale += scaleUp;
	referenceBox.image_yscale += scaleUp;
	allBoxes = array_create(width * height);

		centerOfScreen = (room_width/2) + (referenceBox.sprite_width/2);
		startX = centerOfScreen - (referenceBox.sprite_width * (width/2));
		posX = startX;
		posY = room_height / 8;
	
		instance_destroy(referenceBox);
		for(i=0; i <= width * height; i++)
		{
			box = instance_create_layer(posX, posY, "crossword", obj_crosswordEmpty);
			box.image_xscale += scaleUp;
			box.image_yscale += scaleUp;
			allBoxes[i] = box;
			box.image_alpha = 0;
			if( (i+1) % width == 0)
			{
				posX = startX;
				posY += box.sprite_height-(3*box.image_xscale);
			}
			else
			{
				posX += box.sprite_width-(3*box.image_xscale); 
				if(i=0)
				{
						show_debug_message("sprite_width: ");
		show_debug_message(box.sprite_height);
				show_debug_message("posx ");
				show_debug_message(posX);
				}
				if(i=1)
				{
						show_debug_message("sprite_width: ");
		show_debug_message(box.sprite_height);
				show_debug_message("posx + 1: ");
				show_debug_message(posX);
				}
			}
		}
		for ( i= 0; i < array_length(global.puzzleWords); i++) // tea  page
		{
			isKnownWord = false;
			for ( k=0; k< array_length(global.knownWords); k++)
			{
				if(global.knownWords[k] ==global.puzzleWords[i])
				{
					isKnownWord=true;
					break;
				}
			}
			if(!isKnownWord)
			{
				ds_list_add(global.unknownWords, global.puzzleWords[i]);
			}
			for ( j= 0; j < array_length(global.puzzleWordPosition[i]); j++) // 0,1,2
			{
				index = global.puzzleWordPosition[i][j];
				allBoxes[index].SetLetter(string_char_at(global.puzzleWords[i],j+1),isKnownWord);
			}
		}
		
	global.allBoxes = allBoxes;
	SetCrosswordBoxesDirections(width,height);
}

function SetCrosswordBoxesDirections(crosswordWidth, crosswordHeight)
{
	boxes = global.allBoxes;
	for ( i= 0; i < array_length(boxes); i++)
	{
		if(boxes[i].insideLetter != "")
		{
			height = floor(i / crosswordWidth) + 1;
			width = i - ((height - 1) * crosswordWidth);
			width +=1;
				
			// check if LEFT side is used
			if(i-1 >= 0)
			{
				
				if((width-1) % crosswordWidth != 0 && boxes[i-1].insideLetter != "")
				{
					boxes[i].left = true;
				} 
			}
			
			// check if RIGHT side is used
			if(i+1 < array_length(boxes))
			{
				if(width % crosswordWidth != 0 && boxes[i+1].insideLetter != "")
				{
					boxes[i].right = true;
				}
			}
			//check if TOP side is used
			if(i - crosswordWidth >= 0)
			{
				if((height - 1) >= 1 && boxes[i - crosswordWidth].insideLetter != "")
				{
					boxes[i].top = true;
				}
			}
			
			//check if BOTTOM side is used
			if( (height + 1) <= crosswordHeight && boxes[i + crosswordWidth].insideLetter != "")
			{
				boxes[i].bottom = true;
			}
		if(i == 5)
		{
		    show_debug_message("top: ");
			show_debug_message(boxes[i].top);
			show_debug_message("bottom: ");
			show_debug_message(boxes[i].bottom);
			show_debug_message("right: ");
			show_debug_message(boxes[i].right);
			show_debug_message("left: ");
			show_debug_message(boxes[i].left);
		}
			boxes[i].ChangeSprite();
			
		}
	}
}

function CheckForWord(word)
{
	for ( i=0; i< ds_list_size(global.unknownWords); i++)
	{
		if(global.unknownWords[| i] == word)
		{
			ds_list_delete(global.unknownWords,i);
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
			for ( j=0; j < array_length(global.puzzleWordPosition[i]); j++)
			{
				index = global.puzzleWordPosition[i][j];
				global.allBoxes[index].RevealLetter();
			}
		}
	}
	if(ds_list_size(global.unknownWords) == 0)
	{
			show_debug_message("!!! WIN - all words have been found !!!"); 		
	}
}

function WrongWord(word)
{
	show_debug_message("THIS WORD IS ALREADY KNOWN OR WRONG: ");
	show_debug_message(word);
}