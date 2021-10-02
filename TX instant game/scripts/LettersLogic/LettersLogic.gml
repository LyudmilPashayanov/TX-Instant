// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function CheckForRelease(){
	if(mouse_check_button_released(mb_left))
	{
		ReleaseLetters();
	}
}

function ReleaseLetters()
{
	global.idLetters = -1;
	with(obj_letterHolder)
		{
			pressed=false;
			pressed_once=false;
		}
		obj_letterHolder.sprite_index = spr_letterHolder;
		show_debug_message(global.CurrentWord);
		// Logic to see if the word is correct 
		CheckForWord(global.CurrentWord);
		
		global.CurrentWord = "";
}

function AddLetterToCurrentWord(letterObject)
{	
	global.idLetters += 1;
	global.currentLetters[global.idLetters] = letterObject;
	show_debug_message(array_length_1d(global.currentLetters));
	show_debug_message(global.idLetters);
	global.CurrentWord += letterObject.letter;
}

function ReleaseLastAddedLetter()
{
	show_debug_message("undoing letter");
	global.currentLetters[global.idLetters].UndoLetter();
	global.idLetters -= 1;
	global.CurrentWord = string_delete(global.CurrentWord,string_length(global.CurrentWord),1);
}
