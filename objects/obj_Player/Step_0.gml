if keyboard_check_pressed(ord("R")) estado = "morto";

#region CONTROLES & SENSORES
//var right = keyboard_check(ord("D"));
//var left = keyboard_check(ord("A"));
var jump = keyboard_check_pressed(ord("W"))// or keyboard_check_pressed(vk_up) or keyboard_check_pressed(mb_left) or keyboard_check_pressed(vk_space);
var up = keyboard_check(ord("W"));
var down = keyboard_check(ord("S"))// or keyboard_check_pressed(vk_down) or keyboard_check_pressed(mb_right);

var chao = place_meeting(x,y+1, obj_Solido_base);
#endregion

#region GERENCIADOR DE BUFFER
//jump_buffer

#endregion



switch(estado)
{
	#region PARADO
	case "parado": //esperando tecla ser precionada para começar
	{
		if(sprite_index != spr_teste_parado) sprite_index = spr_teste_parado;
		
		//	Saída
		if keyboard_check_pressed(vk_anykey) or keyboard_check_pressed(mb_any)
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
		if !down and (sprite_index != spr_teste_correndo) sprite_index = spr_teste_correndo;
		else if down and (sprite_index != spr_teste_abaixado) sprite_index = spr_teste_abaixado;
		
		//	Saída
		if !chao or jump
		{
			velv = -6;
			image_index = 0;
			estado = "pulando";
		}
		break;
	}
	#endregion
	
	#region PULANDO
	case "pulando":
	{
		if(sprite_index != spr_teste_pulando) sprite_index = spr_teste_pulando;
		
		//chama gravidade
		if !chao
		{
			velv += .3 - .1 * up + .2 * down; //melhorar isso aqui que tá um horror
		}
		
		
		if velv < 0
		{
			if(image_index > image_number -2) image_index = image_number -2 //numero provisório
		}
		else
		{
			if(image_index > image_number -1) image_index = image_number -1 //numero provisório
		}
		
		//	Saíndo
		if chao
		{
			image_index = 0;
			estado = "correndo";
		}
		break;
	}
	#endregion
	
	case "morto":
		show_message("MORREU!");
		/** /global.jogoComecou = false; //*/ game_restart();
	break;
}
