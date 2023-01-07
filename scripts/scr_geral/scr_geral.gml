// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

#macro GRAVIDADE .1
#macro VELH_INICIAL 2


//	Geração de Obstáculos | atual: de acordo com o tempo de jogo | ideal: de acordo com a velocidade global
function gerar_obstaculo() //solicita bioma atual?
{
	#region CRIA OBSTÁCULO
	if other.obstaculo_asset_buffer != noone
	{
		var spawn_x = room_width * 1.2;
		var spawn_y = room_height - other.nivelChao;
	
		var obstaculo_objeto = instance_create_layer(spawn_x, spawn_y, "Obstaculos", obj_Obstaculo)
		obstaculo_objeto.sprite_index = other.obstaculo_asset_buffer;
	}
	#endregion
	
	#region DECIDE O PRÓXIMO OBSTÁCULO || NOTA: talvez mude quando eu colocar mais biomas
	var tipo, variacao;
	switch(other.tempo_seg div 20)
	{
		case 0:
		{
			tipo = choose("obst_P", "obst_P", "obst_G")
			variacao = "1"
			break;
		}
		case 1:
		{
			tipo = choose("obst_P", "obst_G")
			variacao = choose("1", "1", "2")
			break;
		}
		case 2:
		{
			tipo = choose("obst_P", "obst_P", "obst_G", "obst_G",  "obst_G", "obst_M", "obst_M")
			variacao = choose("1", "1", "2", "2", "3")
			break;
		}
		case 3:
		{
			tipo = choose("obst_P", "obst_G", "obst_G", "obst_G", "obst_M", "obst_M")
			variacao = choose("1", "1", "2", "2", "2", "3", "3")
			break;
		}		
		default:
		{
			tipo = choose("obst_G", "obst_G", "obst_M")
			variacao = choose("1", "2", "2", "3", "3")
			break;
		}
	}
	if(tipo == "obst_M") variacao = "";
	
	other.obstaculo_asset_buffer = asset_get_index("spr_" + tipo + variacao + other.bioma);
	#endregion
	
	#region DEFINE O INTERVALO DE TEMPO
	{//}	Indentifica tipo do obstáculo já definido
		if(other.obstaculo_asset_buffer == spr_obst_P1_deserto) or (other.obstaculo_asset_buffer == spr_obst_P2_deserto) or (other.obstaculo_asset_buffer == spr_obst_P3_deserto) var pre_tipo = "obst_P"
		else if(other.obstaculo_asset_buffer == spr_obst_G1_deserto) or (other.obstaculo_asset_buffer == spr_obst_G2_deserto) or (other.obstaculo_asset_buffer == spr_obst_G3_deserto) var pre_tipo = "obst_G"
		else if(other.obstaculo_asset_buffer == spr_obst_M_deserto) var pre_tipo = "obst_M"
	}
	
	if(other.obstaculo_asset_buffer == noone) var intervalo = 2;
	else if(pre_tipo != "obst_M") and (tipo == "obst_M") var intervalo = 3;
	else var intervalo = irandom_range(2, 4) / 2
	
	other.obstaculo_intervalo_t = room_speed * intervalo // / (other.multiplicador / 2 + .5)
	show_debug_message(string(obstaculo_intervalo_t/room_speed) + "'s até o proximo obstáculo.")
	#endregion
	
	//show_message("TESTE: periodo: " + string(periodo) + " velocidade: " + string(global.velhGlobal) + " obstáculo do tipo " + tipo + variacao + " gerado.");
	//show_debug_message("TESTE: periodo: " + string(periodo) + " velocidade: " + string(global.velhGlobal) + " obstáculo do tipo " + tipo + variacao + " gerado.");
}



/*function alinhamento_vertical(){
	alinha os objetos verticalmnete quando necessário (quando o nivel do chão mudar)
}//*/

function gravidade(){ //será usado por: player, bola de feno, outroPassaro e outras coisas
	with(other) //incompleto? sim
	{
		if(!chao) velv += massa * GRAVIDADE;
	}
}

function movimentacao_vertical()
{
	
}

