/// @description Insert description here
// You can write your code in this editor
if(global.idLetters > 0 && global.currentLetters[global.idLetters - 1] == id)
{
	show_debug_message(array_length_1d(global.currentLetters));
	show_debug_message(global.idLetters-1);
	ReleaseLastAddedLetter();
}