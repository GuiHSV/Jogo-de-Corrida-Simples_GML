
var _velv = sign(velv);
repeat(abs(velv))
{
	if place_meeting(x,y+_velv, obj_Solido_base)
	{
		velv = 0;
		break;
	}
	
	y += _velv;
}

