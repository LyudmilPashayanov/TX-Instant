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
	fill=true;
	id.sprite_index = letter_spot_filled_5;
}

function ChangeSprite()
{
	if(left && !right && !top && !bottom)
	{
		id.sprite_index = letterBoxSides_1;
		id.image_angle -= 90;
	}
	else if(!left && right && !top && !bottom)
	{
		id.sprite_index = letterBoxSides_1;
		id.image_angle += 90;
	}
	else if(!left && !right && top && !bottom)
	{
		id.sprite_index = letterBoxSides_1;
	}
	else if(!left && !right && !top && bottom)
	{
		id.sprite_index = letterBoxSides_1;
		id.image_angle += 180;
	}
	else if(left && right && !top && !bottom)
	{
		id.sprite_index = letterBoxSides_2;
		id.image_angle += 90;
	}
	else if(!left && !right && top && bottom)
	{
		id.sprite_index = letterBoxSides_2;
	}
	else if(left && !right && !top && bottom)
	{
		id.sprite_index = letterBoxSides_2_Angle;
		id.image_angle += 90;
	}
	else if(left && !right && top && !bottom)
	{
		id.sprite_index = letterBoxSides_2_Angle;
		id.image_angle += 180;
	}
	else if(!left && right && top && !bottom)
	{
		id.sprite_index = letterBoxSides_2_Angle;
		id.image_angle -= 90;
	}
	else if(!left && right && !top && bottom)
	{
		id.sprite_index = letterBoxSides_2_Angle;
	}
	else if(left && right && top && !bottom)
	{
		id.sprite_index = letterBoxSides_3;
		id.image_angle += 90;
	}
	else if(left && right && !top && bottom)
	{
		id.sprite_index = letterBoxSides_3;
		id.image_angle -= 90;
	}
	else if(left && !right && top && bottom)
	{
		id.sprite_index = letterBoxSides_3;
		id.image_angle += 180;
	}
	else if(!left && right && top && bottom)
	{
		id.sprite_index = letterBoxSides_3;
	}
	else if(left && right && top && bottom)
	{
		id.sprite_index = letterBoxSides_4;
	}
}