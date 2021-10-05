/// @description Insert description here
// You can write your code in this editor
image_yscale = 3.5;
originalWidth = sprite_width;

function SetLastDestination(lastLetter)
{
	image_xscale = (point_distance(x,y,lastLetter.x,lastLetter.y) + 10) / originalWidth;
	image_angle = point_direction(x, y, lastLetter.x, lastLetter.y);
}