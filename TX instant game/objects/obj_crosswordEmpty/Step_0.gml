/// @description Insert description here
// You can write your code in this editor
if(fill)
{
	filledLetterAlpha = lerp(filledLetterAlpha, 1, 0.04);
	if(filledLetterAlpha>=1)
	{
		fill=false;
	}
}