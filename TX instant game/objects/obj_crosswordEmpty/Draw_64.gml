/// @description Insert description here
// You can write your code in this editor
    //draw_self();
    draw_set_font(font_crosswordLetters);
	
	// hacky way to do the outline.
	var outlineSize = 4;
      draw_text_colour(id.x+outlineSize, id.y+outlineSize,insideLetter,c_black,c_black,c_black,c_black,filledLetterAlpha);
	//draw_text_colour(id.x-outlineSize, id.y-outlineSize,insideLetter,c_black,c_black,c_black,c_black,filledLetterAlpha);
	//draw_text_colour(id.x, id.y+outlineSize,insideLetter,c_black,c_black,c_black,c_black,filledLetterAlpha);
	//draw_text_colour(id.x+outlineSize, id.y,insideLetter,c_black,c_black,c_black,c_black,filledLetterAlpha);
	//draw_text_colour(id.x, id.y-outlineSize,insideLetter,c_black,c_black,c_black,c_black,filledLetterAlpha);
	//draw_text_colour(id.x-outlineSize, id.y,insideLetter,c_black,c_black,c_black,c_black,filledLetterAlpha);
	//draw_text_colour(id.x-outlineSize, id.y+outlineSize,insideLetter,c_black,c_black,c_black,c_black,filledLetterAlpha);
	//draw_text_colour(id.x+outlineSize, id.y-outlineSize,insideLetter,c_black,c_black,c_black,c_black,filledLetterAlpha);
	
	draw_text_colour(id.x,id.y,insideLetter,c_white,c_white,c_white,c_white,filledLetterAlpha);
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);