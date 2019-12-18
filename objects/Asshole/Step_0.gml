/// @description Insert description here
// You can write your code in this editor
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