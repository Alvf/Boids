 /// @description Insert description here
// You can write your code in this editor
if(image_alpha=1){
switch(keyboard_key){
	case vk_left:
	case ord("A"):
		x-=17;
		break;
	case vk_right:
	case ord("D"):
		x+=17;
		break;
	case vk_up:
	case ord("W"):
		y-=17;
		break;
	case vk_down:
	case ord("S"):
		y+=17;
		break;							
}

//wrapping check
if(x>room_width or x<0){
	x +=room_width
	x = x%room_width
}
if(y>=room_height or y<0){
	y+=room_height
	y = y%room_height
}
}
switch(state){
	case astates.fadein:
		if(image_alpha<1){
			image_alpha+=0.05
		}
		else if(keyboard_check_pressed(ord("B"))){
			state = astates.fadeout
		}
		break;
	case astates.fadeout:
		if(image_alpha>0){
			image_alpha-=0.05
		}
		else if(keyboard_check_pressed(ord("B"))){
			state = astates.fadein
		}
		break;
}