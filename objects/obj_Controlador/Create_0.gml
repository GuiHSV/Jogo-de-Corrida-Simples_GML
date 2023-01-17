randomize();

#region	VARIÁVEIS
	//	Propriedades Globais
global.GameStatus = "Iniciando";
{/*}	global.GameStatus
	"Iniciando"
	"Pronto"
	"Jogando"
	"Pausado"
	"FimDeJogo"
*/}
nivelChao = 60; //32 + 28
bioma = "Deserto";
{/*}	Biomas
	Bioma:
		*_sub_bioma (..._variação)
			obstáculos (tipo e frequência/variação)
			
	Deserto:
		*_arenoso (...tempestade de areia)
			cactos (fixo, padrão/raro quando tempestade)
			dunas e rochas (solidos, ocasional)
			bola de feno (móvel, raro/padrão quando tempestade)
		*_montanhoso
			cactos (fixo, padrão)
			dunas e rochas (solidos, padrão)
	Floresta
		*_savana
		*_pantano
		*_tropical (..._chuvosa)
	Montanha
		*_normal
		//...
	Templo_grego
*/}
pontuacao = 0;

	//	Movimentação Global
multiplicador = 0;
velh_acumulador = 0;

	//	Temporizador
tempo_seg = 0;
contador_fps = room_speed;

	//	Geração de obstáculos
obstaculo_asset_buffer = noone;
obstaculo_intervalo_t = 1;

	//	Extras
{/*}
contador de tempo para "game over" pro jogo não acabar
recomeçando instantaneamente quando você morrer e estiver
com o botão apertado
*/}

#endregion

instance_create_layer(x, y, "Controladores", obj_Controlador_Visual);
instance_create_layer(26, room_height-26, "Controladores", obj_botao);

var spawn_x = camera_get_view_x(view_camera[0]) + 48;
var spawn_y = room_height - nivelChao;
/*if(!instance_exists(obj_Player))*/instance_create_layer(spawn_x, spawn_y, "Player", obj_Player);



//	Geração de Obstáculos | atual: de acordo com o tempo de jogo | ideal: de acordo com a velocidade global/*
gerar_obstaculo = function()
{
	//randomize();
	var tipo, pre_tipo, variacao;
	
	#region CRIA OBSTÁCULO
	if obstaculo_asset_buffer != noone
	{
		var spawn_x = room_width * 1.2;
		var spawn_y = room_height - nivelChao;
	
		instance_create_layer(spawn_x, spawn_y, "Obstaculos", obj_Obstaculo,
		{
			sprite_index : obstaculo_asset_buffer
		});
	}
	#endregion
	
	{//}
		if(obstaculo_asset_buffer == spr_obst_M_deserto) pre_tipo = "obst_M";
		else if(obstaculo_asset_buffer == noone) pre_tipo = "nenhum";
		else pre_tipo = "outro";
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
		{/*}	Nota:
			Após esse ponto ser possivel o aparecimento de obstáculos
			de terreno e a mudança de bioma, além di eventos especiaias
		*/}
	}
	if(tipo == "obst_M") variacao = "_";
	else variacao += "_";
	
	var bioma_minus = string_lower(bioma)
	obstaculo_asset_buffer = asset_get_index("spr_" + tipo + variacao + bioma_minus);
	#endregion
	
	#region DEFINE O INTERVALO DE TEMPO
	if(pre_tipo == "nenhum") var intervalo = 2;
	else if(pre_tipo != "obst_M") and (tipo == "obst_M") var intervalo = 2.5;
	else var intervalo = irandom_range(2, 5) / 2;
	intervalo -= (_periodo) / 10;
	
	//NOTA: tempo varia conforme velocidade aumenta. como ficaria balanceado?
	obstaculo_intervalo_t = room_speed * intervalo 
	show_debug_message(string(intervalo) + "'s até o proximo obstáculo.")
	#endregion
}
