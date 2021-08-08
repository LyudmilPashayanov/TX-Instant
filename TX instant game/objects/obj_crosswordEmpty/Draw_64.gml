/// @description Insert description here
// You can write your code in this editor
	draw_self();
	draw_set_font(font_crosswordLetters);
	draw_text(id.x,id.y,insideLetter);
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_color(c_black);
	draw_set_alpha(1);
	
	

function FillInLetter()// animation to fill letterbox
{
    draw_self();
    draw_set_font(font_crosswordLetters);
	draw_text(id.x,id.y,"F");
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_color(c_black);
	draw_set_alpha(1);
	//show_debug_message(lerp(0,10,0.01));
}