#region CONTROLES & SENSORES
var /*right, left,*/ up, down, jump;
//right = global.GameStatus == "Jogando" and (keyboard_check(ord("D") or ...);
//left = global.GameStatus == "Jogando" and (keyboard_check(ord("A") or ...);
up = global.GameStatus == "Jogando" and (keyboard_check(ord("W")) or keyboard_check(vk_up) or keyboard_check(vk_space));
down = global.GameStatus == "Jogando" and (keyboard_check(ord("S")) or keyboard_check(vk_down));
jump = global.GameStatus == "Jogando" and (keyboard_check_pressed(ord("W")) or keyboard_check_pressed(vk_up) or keyboard_check_pressed(vk_space));

chao = colisao_solo(1);
#endregion


#region GERENCIADOR
if(global.GameStatus = "FimDeJogo") estado = "morto";

if(global.GameStatus == "Pausado" or global.GameStatus == "FimDeJogo") image_speed = 0;
else image_speed = 1;

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
		
		//	Saída/*
		if global.GameStatus == "Pronto" and keyboard_check_pressed(vk_space) //alterar quando for implementar os botões de menu e outras coisas
		{
			global.GameStatus = "Jogando";
			image_index = 0;
			estado = "correndo";
		}//*/
		break;
	}
	#endregion
	
	#region CORRENDO
	case "correndo": 
	{
		if !down and (sprite_index != spr_player_correndo) sprite_index = spr_player_correndo;
		else if down and (sprite_index != spr_player_abaixado) sprite_index = spr_player_abaixado;
		
		//	Saída
		if !chao || jump_buffer
		{
			velv = -5;
			image_index = 0;
			estado = "pulando";
		}
		break;
	}
	#endregion
	
	#region PULANDO (*)
	//Necessário balanceamento
	//bug que substitui o último quadro pelo primeiro, ver isso depois. talvez seja necessário mudar a troca de sprites.
	case "pulando":
	{
		//show_message("TESTE")
		if(sprite_index != spr_player_pulando) sprite_index = spr_player_pulando;
		
		#region GRAVIDADE & ANIMAÇÃO
		gravidade();
		
		if(velv <= 0) velv -= .1 * up;
		else velv += .2 * down;
		
		if(velv < -.5) and (image_index >= 3) image_index = 1;
		else if(!chao) and (-.5 < velv && velv < 0)	image_index = 3;
		else if(velv > 0) and (image_index >= 6) image_index = 4;
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
	
	#region MORTO (*)
	case "morto":
	{
		if sprite_index != spr_player_morto
		{
			var abaixado = (sprite_index == spr_player_abaixado);
			var pulando = (sprite_index == spr_player_pulando);
			sprite_index = spr_player_morto;
			if(abaixado) image_index += 5;
			else if(pulando) image_index += 10;
		}
		break;
	}
	#endregion
}
#endregion


if(global.GameStatus == "Jogando") movimentacao_vertical();
