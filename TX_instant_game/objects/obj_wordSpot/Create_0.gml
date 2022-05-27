/// @description Insert description here
// You can write your code in this editor
x = global.wordSpotPosX_3;
y = global.wordSpotPosY_3;

function HandleWidth()
{
	visible=true;
	stretchedAmount = string_length(global.CurrentWord);
	image_xscale = 0.8 + (stretchedAmount*0.2);
}