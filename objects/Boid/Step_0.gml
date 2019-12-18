/// @description Insert description here
// You can write your code in this editor

//wrapping check
if(x>room_width or x<0){
	x +=room_width
	x = x%room_width
}
if(y>=room_height or y<0){
	y+=room_height
	y = y%room_height
}

image_angle = point_direction(0,0,-hspeed,-vspeed)

//speed matching behavior
var nethspeed =0 
var netvspeed =0
var total = 0
with(Boid){
	var distance =distance_to_point(other.x,other.y)
	if(distance<=other.perception and distance!=0){
		nethspeed+=hspeed
		netvspeed+=vspeed
		total+=1
	}
}
if(total!=0){
hspeed += (nethspeed/total -hspeed)/10/mass
vspeed += (netvspeed/total-vspeed)/10/mass
}

//cohesion
var netx = 0
var nety = 0
var total = 0
with(Boid){
	var distance =distance_to_point(other.x,other.y)
	if(distance<=other.perception and distance!=0){
		netx+=x
		nety+=y
		total+=1
	}
}
if(total!=0){
	var comx = netx/total
	var comy = nety/total
	var steer = point_distance(other.x,other.y,comx,comy)
	hspeed += (comx-other.x)/steer/mass
	vspeed += (comy-other.y)/steer/mass
}

//antisocial
var xcont = 0
var ycont = 0
var total = 0
with(Boid){
	var distance =distance_to_point(other.x,other.y)
	if(distance<=other.perception/1.4 and distance!=0){
		xcont += other.mass*mass*(other.x-x)/(6*distance)
		ycont += other.mass*mass*(other.y-y)/(6*distance)
		total++
	}
}
if(total!=0){
	hspeed += xcont/mass
	vspeed += ycont/mass
}

var xcont = 0
var ycont = 0
var total = 0
with(Barrier){
	var distance =distance_to_point(other.x,other.y)
	if(distance<=other.perception and distance!=0){
		xcont += other.mass*(other.x-x)/(distance)
		ycont += other.mass*(other.y-y)/(distance)
		total++
	}
}
if(total!=0){
	hspeed += xcont/mass
	vspeed += ycont/mass
}


if(speed>=mspeed){
	speed = mspeed
}
if(speed>=mspeed*3/4){
	speed-=0.1
}