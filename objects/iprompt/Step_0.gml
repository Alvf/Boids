/// @description Insert description here
// You can write your code in this editor

switch(state){
	case statesiprompt.intro:
		if(current_time-spawntime>5500){
			state = statesiprompt.asleep
		}
		else if(image_alpha<1){
			image_alpha+=0.025
		}
		break;
	case statesiprompt.wakeup:
		if(image_alpha<1){
			image_alpha+=0.05
		}
		else if(distance_to_point(mouse_x,mouse_y)>=15){
			state = statesiprompt.asleep
		}
		else if(keyboard_check_pressed(ord("I"))){
			state = statesiprompt.displaying
			image_alpha = 0
			sprite_index = spr_instructions
			x = 1280
			y = 0
		}
		break;
	case statesiprompt.asleep:
		if(image_alpha = 0){
			sprite_index = spr_instructionprompt
			x = 1280
			y = 1312
		}
		if(image_alpha>0){
			image_alpha -=0.05
		}
		else if(distance_to_point(mouse_x,mouse_y)<15){
			state = statesiprompt.wakeup
		}
		else if(keyboard_check_pressed(ord("I"))){
			state = statesiprompt.displaying
			sprite_index = spr_instructions
			x = 1280
			y = 0
		}
		break;
	case statesiprompt.displaying:
		if(image_alpha<1){
			image_alpha+=0.05
		}
		else if(keyboard_check_pressed(ord("I"))){
			state = statesiprompt.asleep
		}
}