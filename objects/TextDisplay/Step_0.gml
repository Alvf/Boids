/// @description Insert description here
// You can write your code in this editor

y = y0+32*sin(current_time/1000)

switch(state){
	case textstates.up:
		if(current_time-spawntime>5000){
			state = textstates.fading
		}
	break;
	case textstates.fading:
		if(image_alpha>0){
			image_alpha-=0.05
		}
		else{
			instance_destroy()
		}
}