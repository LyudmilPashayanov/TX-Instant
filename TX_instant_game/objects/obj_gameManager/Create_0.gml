/// @description Insert description here
// You can write your code in this editor

FBInstantGames_Initialise();
FBInstantGames_SetLoadProgress(100);
FBInstantGames_StartGame("gmcallback_gamestarted", "gmcallback_onpause");

function StartGame()
{	
	DefineLayers();
	CreateCrossword("--C?T?--/--A-A---/-STAC---");
	SetAvailableLetters();
}

StartGame();

global.base_width = room_width;
global.base_height = room_height;
global.currentWidth = 0;
global.currentHeight = 0;
width = global.base_width;
height = global.base_height;
function SetResolution()
{
	if (browser_width != width || browser_height != height)
    {
		width = min(global.base_width, browser_width);
		height = min(global.base_height, browser_height);
		ScaleCanvas(global.base_width, global.base_height, width, height, true);
    }
}

function ScaleCanvas(argument0,argument1,argument2,argument3,argument4)
{
var _bw = argument0;
var _bh = argument1;
var _cw = argument2;
var _ch = argument3;
var _center = argument4;
var _aspect = (_bw / _bh);

if ((_cw / _aspect) > _ch)
    {
		window_set_size((_ch *_aspect), _ch);
	}
else
    {
		window_set_size(_cw, (_cw / _aspect));
	}
if (_center)
    {
		window_center();
    }
	global.rescaledWidth = min(window_get_width(), _bw);
	global.rescaledHeight = min(window_get_height(), _bh);
	if(global.rescaledWidth != global.currentWidth || global.rescaledHeight != global.currentHeight)
	{
		Debug("global.currentWidth" + string(global.currentWidth) + " global.rescaledWidth " + string(global.rescaledWidth));
		global.currentWidth = global.rescaledWidth;
		global.currentHeight = global.rescaledHeight;
		surface_resize(application_surface, global.rescaledWidth, global.rescaledHeight);
		display_set_gui_size(view_wport[0], view_hport[0]);
	}
}