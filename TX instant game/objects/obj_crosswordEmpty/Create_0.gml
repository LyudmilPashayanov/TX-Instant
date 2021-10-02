/// @description Insert description here
// You can write your code in this editor

fill=false;
filledLetterAlpha = 0;

function SetLetter(letterToSet, show)
{
	insideLetter = letterToSet;
	id.image_alpha=1;
	if(show)
	{
		filledLetterAlpha=1;
		id.sprite_index = letter_spot_filled_5;
	}
}

function RevealLetter()
{
	// animation
	//FillInLetter();
	fill=true;
	id.sprite_index = letter_spot_filled_5;
}