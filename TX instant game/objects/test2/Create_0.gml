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
		unvealed = true;
	}
}

function SetLetterUnvealed()
{
	filledLetterAlpha=1;
	id.sprite_index = asset_get_index(spriteToFill);
}

function RevealLetter()
{
	fill=true;
	id.sprite_index = asset_get_index(spriteToFill);
}

function ChangeSprite()
{
	if(left && !right && !top && !bottom)
	{
		id.sprite_index = letterBoxSides_1;
		id.image_angle -= 90;
		spriteToFill = "letterBoxFilled_1";
	}
	else if(!left && right && !top && !bottom)
	{
		id.sprite_index = letterBoxSides_1;
		id.image_angle += 90;
		spriteToFill = "letterBoxFilled_1";
	}
	else if(!left && !right && top && !bottom)
	{
		id.sprite_index = letterBoxSides_1;
		id.image_angle += 180;
		spriteToFill = "letterBoxFilled_1";
	}
	else if(!left && !right && !top && bottom)
	{
		id.sprite_index = letterBoxSides_1;	
		spriteToFill = "letterBoxFilled_1";
	}
	else if(left && right && !top && !bottom)
	{
		id.sprite_index = letterBoxSides_2;
		id.image_angle += 90;
		spriteToFill = "letterBoxFilled_2";
	}
	else if(!left && !right && top && bottom)
	{
		id.sprite_index = letterBoxSides_2;
		spriteToFill = "letterBoxFilled_2";
	}
	else if(left && !right && !top && bottom)
	{
		id.sprite_index = letterBoxSides_2_Angle;
		id.image_angle += 90;
		spriteToFill = "letterBoxFilled_2_Angle";
	}
	else if(left && !right && top && !bottom)
	{
		id.sprite_index = letterBoxSides_2_Angle;
		id.image_angle += 180;
		spriteToFill = "letterBoxFilled_2_Angle";
	}
	else if(!left && right && top && !bottom)
	{
		id.sprite_index = letterBoxSides_2_Angle;
		id.image_angle -= 90;
		spriteToFill = "letterBoxFilled_2_Angle";
	}
	else if(!left && right && !top && bottom)
	{
		id.sprite_index = letterBoxSides_2_Angle;
		spriteToFill = "letterBoxFilled_2_Angle";
	}
	else if(left && right && top && !bottom)
	{
		id.sprite_index = letterBoxSides_3;
		id.image_angle += 90;
		spriteToFill = "letterBoxFilled_3";
	}
	else if(left && right && !top && bottom)
	{
		id.sprite_index = letterBoxSides_3;
		id.image_angle -= 90;
		spriteToFill = "letterBoxFilled_3";
	}
	else if(left && !right && top && bottom)
	{
		id.sprite_index = letterBoxSides_3;
		id.image_angle += 180;
		spriteToFill = "letterBoxFilled_3";
	}
	else if(!left && right && top && bottom)
	{
		id.sprite_index = letterBoxSides_3;
		spriteToFill = "letterBoxFilled_3";
	}
	else if(left && right && top && bottom)
	{
		id.sprite_index = letterBoxSides_4;
		spriteToFill = "letterBoxFilled_4";
	}
	if(unvealed)
	{
		SetLetterUnvealed();
	}
}