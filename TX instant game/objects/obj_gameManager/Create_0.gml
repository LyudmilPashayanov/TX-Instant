/// @description Insert description here
// You can write your code in this editor
base_width = room_width;
base_height = room_height;
width = base_width;
height = base_height;

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

surface_resize(application_surface, min(window_get_width(), _bw), min(window_get_height(), _bh));
}