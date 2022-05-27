/// @description Insert description here
// You can write your code in this editor
if(movable)
{
	image_xscale = (point_distance(x,y,mouse_x,mouse_y) + 10) / originalWidth;
	image_angle = point_direction(x, y, mouse_x, mouse_y);
}