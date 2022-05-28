/// @description Insert description here
// You can write your code in this editor


	
	draw_self();
	draw_set_font(font_letters);
	//var outlineSize = 4;
    //draw_text_colour(id.x+outlineSize, id.y+outlineSize,insideLetter,c_black,c_black,c_black,c_black,filledLetterAlpha);
	

	Debug("X= " + string(x) + "   Y= " + string(y));
	draw_text_colour(x,y,letter,c_black,c_black,c_black,c_black,1);
