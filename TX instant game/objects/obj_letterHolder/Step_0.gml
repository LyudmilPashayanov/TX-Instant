/// @description Insert description here
// You can write your code in this editor

if(pressed && !pressed_once)
{
	pressed_once = true;
	id.sprite_index = spr_letterSelected;
	AddLetterToCurrentWord(id);
}