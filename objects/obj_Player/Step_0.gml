if keyboard_check_pressed(ord("R")) estado = "morto";

//var right = keyboard_check(ord("D"));
//var left = keyboard_check(ord("A"));
var jump = keyboard_check_pressed(vk_space);

if jump
{
	velv -= 10
}

//velh = (right - left) * 3;


switch(estado)
{
	//case "espera": //esperando o jogo ficar pronto para começar
	
	#region PARADO
	case "parado": //esperando tecla ser precionada para começar
	{
		if switch_estado
		{
			global.estaJogando = false;
			sprite_index = spr_teste_parado;
			switch_estado = false;
		}
		
		//	Saída
		if keyboard_check_pressed(vk_anykey)
		{
			global.estaJogando = true;
			estado = "correndo";
			switch_estado = true;
		}
		break;
	}
	#endregion
	
	#region CORRENDO
	case "correndo": 
	{
		if switch_estado
		{
			//global.estaJogando = false;
			sprite_index = spr_teste_correndo;
			switch_estado = false;
		}
		
		//	Saída
		if false //se pulou
		{
			estado = "pulando";
			switch_estado = true;
		}
		break;
	}
	#endregion
	
	/*
	case "pulando":
	
	break;//*/
	
	case "morto":
		show_message("MORREU!");
		room_restart();
	break;
}


/*
var _velh = sign(velh);
repeat(abs(velh))
{
	if place_meeting(x+_velh, y, obj_Solido) and !place_meeting(x+_velh, y-1, obj_Solido)
	{
		y--;
	}
	
	if !place_meeting(x+_velh, y, obj_Solido) and !place_meeting(x+_velh, y+1, obj_Solido) and !place_meeting(x+_velh, y+2, obj_Solido)
	{
		//show_message("teste")
		y++;
	}

	if place_meeting(x+_velh,y, obj_Solido)
	{
		show_message("bateu")
		velh = 0;
		break;
	}
	
	x += _velh;
}

//

if !place_meeting(x,y+1, obj_Solido)
{
	//show_message("no ar");
	velv += .5;
}

var _velv = sign(velv);
repeat(abs(velv))
{
	if place_meeting(x,y+_velv, obj_Solido)
	{
		velv = 0;
		break;
	}
	
	y += _velv;
}

