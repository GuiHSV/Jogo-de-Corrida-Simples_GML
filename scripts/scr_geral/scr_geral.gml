// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

#macro GRAVIDADE .1
#macro VELH_INICIAL 2


function potenciacao(_numero, _expoente)
{
	if(_expoente == 0) and (_numero != 0) return 1;
	
	var _resultado = _numero;
	repeat(_expoente-1)	_resultado = _resultado * _numero;
	return _resultado;
}


//	Geração de Obstáculos | atual: de acordo com o tempo de jogo | ideal: de acordo com a velocidade global
function gerar_obstaculo() //solicita bioma atual? Deveria estar no próprio controlador.
{
	randomize();
	var tipo, pre_tipo, variacao;
	
	#region CRIA OBSTÁCULO
	if other.obstaculo_asset_buffer != noone
	{
		var spawn_x = room_width * 1.2;
		var spawn_y = room_height - other.nivelChao;
	
		instance_create_layer(spawn_x, spawn_y, "Obstaculos", obj_Obstaculo,
		{
			sprite_index : other.obstaculo_asset_buffer
		});
	}
	//else pre_tipo = "nenhum"
	#endregion
	
	{//}
		if(other.obstaculo_asset_buffer == spr_obst_P1_deserto) or (other.obstaculo_asset_buffer == spr_obst_P2_deserto) or (other.obstaculo_asset_buffer == spr_obst_P3_deserto) var pre_tipo = "obst_P"
		else if(other.obstaculo_asset_buffer == spr_obst_G1_deserto) or (other.obstaculo_asset_buffer == spr_obst_G2_deserto) or (other.obstaculo_asset_buffer == spr_obst_G3_deserto) var pre_tipo = "obst_G"
		else if(other.obstaculo_asset_buffer == spr_obst_M_deserto) var pre_tipo = "obst_M"
		else var pre_tipo = "nenhum";
	}
	
	#region DECIDE O PRÓXIMO OBSTÁCULO || NOTA: ainda falta balanceamento
	var _periodo = clamp(floor(global.velhGlobal)-2, 0, 5)
	switch(_periodo)
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
			tipo = choose("obst_P", "obst_P", "obst_G", "obst_G", "obst_M")
			variacao = choose("1", "1", "1", "2", "2", "3")
			break;
		}
		case 3:
		{
			tipo = choose("obst_P", "obst_G", "obst_G", "obst_M")
			variacao = choose("1", "1", "2", "2", "2", "3", "3")
			break;
		}
		case 4:
		{
			tipo = choose("obst_P", "obst_G", "obst_G", "obst_G", "obst_M", "obst_M")
			variacao = choose("1", "2", "2", "2", "3", "3")
			break;
		}
		case 5:
		{
			tipo = choose("obst_G", "obst_G", "obst_M")
			variacao = choose("1", "2", "2", "3", "3", "3")
			break;
		}
	}
	if(tipo == "obst_M") variacao = "";
	
	other.obstaculo_asset_buffer = asset_get_index("spr_" + tipo + variacao + other.bioma);
	#endregion
	
	#region DEFINE O INTERVALO DE TEMPO
	if(pre_tipo == "nenhum") var intervalo = 2;
	else if(pre_tipo != "obst_M") and (tipo == "obst_M") var intervalo = 2.5;
	else var intervalo = irandom_range(2, 5) / 2;
	intervalo -= (other.multiplicador-1) / 5;
	
	//NOTA: tempo varia conforme velocidade aumenta. como ficaria balanceado?
	other.obstaculo_intervalo_t = room_speed * intervalo 
	show_debug_message(string(intervalo) + "'s até o proximo obstáculo.")
	#endregion
}



/*function alinhamento_vertical(){
	alinha os objetos verticalmnete quando necessário (quando o nivel do chão mudar)
}//*/

function gravidade() //será usado por: player, bola de feno, outroPassaro e outras coisas
{
	with(other)	if(global.GameStatus == "Jogando") and (!chao) velv += massa * GRAVIDADE;
}

#region MOVIMENTAÇÃO VERTICAL
function movimentacao_vertical()
{
	with(other)
	{
		var _velv = sign(velv);
		repeat(abs(velv))
		{
			if colisao_solo(_velv) 
			{
				velv = 0;
				break;
			}
	
			y += _velv;
		}
	}
}
#endregion
