function reset_variables() {
	left = 0;
	right = 0;
	up = 0;
	down = 0;
	hmove = 0;
	vmove = 0;
}

function get_input() {
	if keyboard_check(ord("A")) left	= 1;
	if keyboard_check(ord("D")) right	= 1;
	if keyboard_check(ord("W")) up		= 1;
	if keyboard_check(ord("S")) down	= 1;
}

function calc_movement() {
	hmove = right - left;
	vmove = down - up;
	
	if hmove != 0 || vmove != 0 {
		var _dir = point_direction(0, 0, hmove, vmove);
		
		hmove = lengthdir_x(walk_spd, _dir);
		vmove = lengthdir_y(walk_spd, _dir);
		
		x += hmove;
		y += vmove;
	}
}


function collision() {
	var _tx = x;
	var _ty = y;
	
	x = xprevious;
	y = yprevious;
	
	var _disx = abs(_tx - x);
	var _disy = abs(_ty - y);
	
	repeat(_disx) {
		if (!place_meeting(x+sign(_tx - x), y, o_solid)) {
			x += sign(_tx - x);
		}
	}
	
	repeat(_disy) {
		if (!place_meeting(x, y+sign(_ty - y), o_solid)) {
			y += sign(_ty - y);
		}
	}
}




















