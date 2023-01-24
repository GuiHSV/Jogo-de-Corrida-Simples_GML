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
chao_y = room_height - 60; //32 + 28
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

	//	Geração do Terreno e Obstáculos
//terreno_timer = 0;
terreno_imagem = 1;
obstaculo_intervalo_t = 1; //obstaculo_timer = 1;
obstaculo_asset_buffer = noone;


	//	Extras
//emTransicao = false;

{/*}
contador de tempo para "game over" pro jogo não acabar
recomeçando instantaneamente quando você morrer e estiver
com o botão apertado
*/}
#endregion

#region CRIANDO CENA
	//	Controladores Auxiliares
instance_create_layer(x, y, "Controladores", obj_Controlador_Visual);
//instance_create_layer(26, 26, "Controladores", obj_botao);

	//	Criando solo
var _x = 0;
do
{
	instance_create_layer(_x, chao_y, "Chao", obj_Solido,
	{
		sprite_index : asset_get_index("spr_solo_" + string(terreno_imagem) + "_" + string_lower(bioma)),
		corrigir_posicao : false
	});
	
	if(terreno_imagem = 3) terreno_imagem = 1;
	else terreno_imagem++;
	
	_x += 64;
}
until _x >= room_width;

	//	Player
var spawn_x = camera_get_view_x(view_camera[0]) + 48;
var spawn_y = chao_y;
/*if(!instance_exists(obj_Player))*/instance_create_layer(spawn_x, spawn_y, "Player", obj_Player);
#endregion


#region GERA TERRENO

#endregion

#region GERA OBSTÁCULOS
gerar_obstaculo = function()
{
	var tipo, pre_tipo, variacao;
	
	#region CRIA OBSTÁCULO
	if obstaculo_asset_buffer != noone
	{
		var spawn_x = room_width * 1.2;
		var spawn_y = chao_y;
	
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
	
	#region DECIDE O PRÓXIMO OBSTÁCULO (*) || NOTA: adequar ao aumento não linear do multiplicador
	var _periodo = floor(global.velhGlobal)-2;
	switch(clamp(_periodo, 0, 5))
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
	if(tipo == "obst_M") variacao = "";
	
	var bioma_minus = "_" + string_lower(bioma);
	obstaculo_asset_buffer = asset_get_index("spr_" + tipo + variacao + bioma_minus);
	#endregion
	
	#region DEFINE O INTERVALO DE TEMPO (*)
	if(pre_tipo == "nenhum") var intervalo = 2;
	else if(pre_tipo != "obst_M") and (tipo == "obst_M") var intervalo = 2.5;
	else var intervalo = irandom_range(2, 5) / 2;
	intervalo -= (_periodo) / 10;
	
	//NOTA: tempo varia conforme velocidade aumenta. como ficaria balanceado?
	obstaculo_intervalo_t = room_speed * intervalo 
	show_debug_message(string(intervalo) + "'s até o proximo obstáculo.")
	#endregion
}
#endregion
