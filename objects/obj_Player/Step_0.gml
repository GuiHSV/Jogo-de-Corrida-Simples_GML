if keyboard_check_pressed(ord("R")) estado = "morto";

#region CONTROLES & SENSORES
var/* right, left,*/ up, down, jump;
//right = keyboard_check(ord("D"));
//left = keyboard_check(ord("A"));
up = keyboard_check(ord("W"));
down = keyboard_check(ord("S"))// or keyboard_check_pressed(vk_down) or keyboard_check_pressed(mb_right);
jump = keyboard_check_pressed(ord("W"))// or keyboard_check_pressed(vk_up) or keyboard_check_pressed(mb_left) or keyboard_check_pressed(vk_space);

chao = place_meeting(x,y+1, obj_Solido_base);
#endregion

#region GERENCIADOR DE BUFFER
if(jump) jump_buffer = room_speed / 2;
else if(jump_buffer > 0) jump_buffer--;
//...

#endregion



switch(estado)
{
	#region PARADO
	case "parado": //esperando tecla ser precionada para começar
	{
		if(sprite_index != spr_player_parado) sprite_index = spr_player_parado;
		
		//	Saída
		if keyboard_check_pressed(vk_anykey) //or keyboard_check_pressed(mb_any)
		{
			global.jogoComecou = true;
			image_index = 0;
			estado = "correndo";
		}
		break;
	}
	#endregion
	
	#region CORRENDO
	case "correndo": 
	{
		if !down and (sprite_index != spr_player_correndo) sprite_index = spr_player_correndo;
		else if down and (sprite_index != spr_player_abaixado) sprite_index = spr_player_abaixado;
		
		//	Saída
		if !chao or jump_buffer
		{
			velv = -5;
			image_index = 0;
			estado = "pulando";
		}
		break;
	}
	#endregion
	
	#region PULANDO
	case "pulando":
	{
		if(sprite_index != spr_player_pulando) sprite_index = spr_player_pulando;
		
		#region GRAVIDADE & ANIMAÇÃO
		gravidade();
		if(velv <= 0) velv -= .1 * up;
		else velv += .2 * down;
		
		if(velv < -.5) and (image_index > 4) image_index = 1;
		else if(-.5 < velv) and (velv < 0) image_index = 4;
		else if(!chao) and (image_index > 8) image_index = 5
		#endregion
		
		//	Saída
		if chao
		{
			image_index = 1;
			estado = "correndo";
		}
		break;
	}
	#endregion
	
	#region MORTO
	case "morto":
	{
		global.jogoComecou = false;
		if sprite_index != spr_player_correndo_morto and sprite_index != spr_player_abaixado_morto and sprite_index != spr_player_pulando_morto
		{
			if(sprite_index == spr_player_correndo) sprite_index = spr_player_correndo_morto;
			else if(sprite_index == spr_player_abaixado) sprite_index = spr_player_abaixado_morto;
			else if(sprite_index == spr_player_pulando) sprite_index = spr_player_pulando_morto;
		}
		else
		{
			show_message("MORREU!");
			game_restart();
		}
		break;
	}
	#endregion
}
