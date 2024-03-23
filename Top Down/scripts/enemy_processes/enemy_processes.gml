
function check_facing() {
	var _facing = sign(x - xp);
	if _facing != 0 facing = _facing;
}

/// @description   check if the player is close enough to start chasing them
function check_for_player(){
	var _dis = distance_to_object(o_player);
	calc_path_timer -= 1;
	
	if (_dis <= alert_dis or alert) and _dis > attack_dis {
		alert = true
		if (calc_path_timer <= 0) {
			calc_path_timer = calc_path_delay;
			//if x = xp and y = yp var _type = 0 else var _type = 1;
			var _found_player = mp_grid_path(global.mp_grid, path, x, y, o_player.x, o_player.y, choose(0, 1));
	
			if _found_player {
				path_start(path, move_spd, path_action_stop, false);
			}
		}
	} else {
		if _dis <= attack_dis {
			path_end();
		}
	}
	
}

function enemy_anim() {
	switch (state) {
		case STATES.IDLE:
			sprite_index = s_idle;
			break;
		case STATES.MOVE:
			sprite_index = s_walk;
			break;
		case STATES.ATTACK:
			sprite_index = s_attack;
			break;
		case STATES.DEAD:
			sprite_index = s_dead;
			break;
	}
	
	xp = x;
	yp = y;
	
	image_xscale = facing;

}