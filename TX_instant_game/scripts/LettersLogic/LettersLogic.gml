
// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function CheckForRelease(){
	if(mouse_check_button_released(mb_left))
	{
		ReleaseLetters();
	}
}

	global.indexLetterObjects = -1;
	global.swipeStripesIndex = -1;
	
function ReleaseLetters()
{
	show_debug_message("ReleaseLetters ReleaseLetters ReleaseLetters ReleaseLetters ReleaseLetters ");
	global.indexLetterObjects = -1;
	with(obj_letterHolder)
		{
			pressed=false;
			pressed_once=false;
		}
		obj_letterHolder.sprite_index = spr_letterHolder;
		RemoveAllSwipeStripes();
		CheckForWord(global.CurrentWord); // Logic to see if the word is correct 
		wordFrame_object.visible=false;
		global.CurrentWord = "";
}

function AddLetterToCurrentWord(letterObject)
{	
	global.indexLetterObjects += 1;
	global.currentLetters[global.indexLetterObjects] = letterObject;
	global.CurrentWord += letterObject.letter;
	AddSwipeStripe(letterObject);
	wordFrame_object.HandleWidth();
}

function ReleaseLastAddedLetter()
{
	global.currentLetters[global.indexLetterObjects].UndoLetter();
	global.indexLetterObjects -= 1;
	RemoveSwipeStripe();
	global.CurrentWord = string_delete(global.CurrentWord,string_length(global.CurrentWord),1);
	wordFrame_object.HandleWidth();
}

function AddSwipeStripe(positionObject)
{
	if(global.swipeStripesIndex >= 0)
	{
		global.currentSwipeStripe.movable = false;
		global.currentSwipeStripe.SetLastDestination(positionObject);
	}
	global.swipeStripesIndex += 1;
	global.currentSwipeStripe = instance_create_layer(positionObject.x,positionObject.y,"swipeStripes",obj_swipeStripe);
	global.swipeStripes[global.swipeStripesIndex] = global.currentSwipeStripe;
	global.currentSwipeStripe.movable = true;
}

function RemoveSwipeStripe()
{
	instance_destroy(global.swipeStripes[global.swipeStripesIndex]); 
	global.swipeStripesIndex -= 1;
	global.currentSwipeStripe = global.swipeStripes[global.swipeStripesIndex];
	global.currentSwipeStripe.movable = true;
}

function RemoveAllSwipeStripes()
{	
	for(i=0; i <= global.swipeStripesIndex; i++)
	{
		instance_destroy(global.swipeStripes[i]);
	}
	global.swipeStripesIndex = -1;
}
