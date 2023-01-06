if keyboard_check_pressed(ord("R")) estado = "morto";

#region CONTROLES & SENSORES
var/* right, left,*/ up, down, jump;
//right = keyboard_check(ord("D"));
//left = keyboard_check(ord("A"));
up = keyboard_check(ord("W")) or keyboard_check(vk_up) or keyboard_check(vk_space);
down = keyboard_check(ord("S")) or keyboard_check(vk_down); //or keyboard_check_pressed(mb_right);
jump = keyboard_check_pressed(ord("W")) or keyboard_check_pressed(vk_up) or keyboard_check_pressed(vk_space); // or keyboard_check_pressed(mb_left)

chao = collision_line(x-8,y+1, x+2,y+1, obj_Solido_base, false, true); //place_meeting(x,y+1, obj_Solido_base);
#endregion

#region GERENCIADOR
if(global.GameStatus == "Iniciado" or global.GameStatus == "Jogando") image_speed = 1;
else image_speed = 0;

if(jump) jump_buffer = room_speed / 4;
else if(jump_buffer > 0) jump_buffer--;
//...

#endregion


#region MAQUINA DE ESTADOS
switch(estado)
{
	#region PARADO
	case "parado": //esperando tecla ser precionada para começar
	{
		if(sprite_index != spr_player_parado) sprite_index = spr_player_parado;
		
		//	Saída
		if keyboard_check_pressed(vk_anykey) //alterar quando for implementar os botões de menu e outras coisas
		{
			global.GameStatus = "Jogando";
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
	
	#region PULANDO (*)
	case "pulando":
	{
		if(sprite_index != spr_player_pulando) sprite_index = spr_player_pulando;
		
		//bug de não aparecer ultimo quadro, ver isso depois
		
		#region GRAVIDADE & ANIMAÇÃO
		gravidade();
		if(velv <= 0) velv -= .1 * up;
		else velv += .2 * down;
		
		if(velv < -.5) and (image_index > 4)
		{
			image_index = 1;
		}
		else if(-.5 < velv) and (velv < 0)
		{
			image_index = 4;
		}
		else if(!chao) and (image_index > 8)
		{
			image_index = 5;
		}
		#endregion
		
		//	Saída
		if chao //and image_index > image_number -1
		{
			//show_message("TESTE")
			image_index = 1;
			estado = "correndo";
		}
		break;
	}
	#endregion
	
	#region MORTO (*)
	case "morto":
	{
		global.GameStatus = "FimDeJogo";
		if sprite_index != spr_player_morto
		{
			var abaixado = (sprite_index == spr_player_abaixado);
			var pulando = (sprite_index == spr_player_pulando);
			sprite_index = spr_player_morto;
			if(abaixado) image_index += 5;
			else if(pulando) image_index += 10;
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
#endregion


#region MOVIMENTAÇÃO VERTICAL
var _velv = sign(velv);
repeat(abs(velv))
{
	var _chao = collision_line(x-8,y+1, x+2,y+1, obj_Solido_base, false, true);
	if collision_line(x-8,y+_velv, x+2,y+_velv, obj_Solido_base, false, true)
	{
		velv = 0;
		break;
	}
	
	y += _velv;
}
#endregion
