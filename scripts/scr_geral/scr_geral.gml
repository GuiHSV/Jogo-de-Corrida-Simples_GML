// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

#macro GRAVIDADE .1
#macro VELH_INICIAL 2


//	Geração de Obstáculos | atual: de acordo com o tempo de jogo | ideal: de acordo com a velocidade global
function gerar_obstaculo() //solicita bioma atual?
{
	var intervalo = irandom_range(2, 4) / 2
	other.obstaculo_intervalo_t = (room_speed * intervalo) // / (other.multiplicador / 2 + .5)
	show_debug_message(string(obstaculo_intervalo_t/room_speed) + "'s até o proximo obstáculo.")
	var tipo, variacao;
	
	#region ESCOLHE O OBJETO || NOTA: talvez mude quando eu colocar mais biomas
	var periodo = other.tempo_seg div 20;
	switch(periodo)
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
	#endregion
	
	//show_message("TESTE: periodo: " + string(periodo) + " velocidade: " + string(global.velhGlobal) + " obstáculo do tipo " + tipo + variacao + " gerado.");
	//show_debug_message("TESTE: periodo: " + string(periodo) + " velocidade: " + string(global.velhGlobal) + " obstáculo do tipo " + tipo + variacao + " gerado.");
	
	//cria os obstáculos e passa os valores para eles
	var spawn_x = room_width * 1.2;
	var spawn_y = room_height - other.nivelChao;
	
	var obstaculo_objeto = instance_create_layer(spawn_x, spawn_y, "Obstaculos", obj_Obstaculo)
	obstaculo_objeto.sprite_index = asset_get_index("spr_" + tipo + variacao + other.bioma);
}



/*function alinhamento_vertical(){
	alinha os objetos verticalmnete quando necessário (quando o nivel do chão mudar)
}//*/

function gravidade(){ //será usado por: player, bola de feno, outroPassaro e outras coisas
	with(other) //incompleto?
	{
		if(!chao) velv += massa * GRAVIDADE;
	}
}

