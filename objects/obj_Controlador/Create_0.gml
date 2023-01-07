randomize();

#region	VARIÁVEIS
	//	Propriedades Globais
global.GameStatus = "Iniciado";
{/*}	global.GameStatus
	"Iniciado"
	"Jogando"
	"Pausado"
	"FimDeJogo"
	"Transição"
*/}
nivelChao = 60; //32 + 28
bioma = "_deserto";
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

	//	Movimentação Global
multiplicador = 1;
velh_acumulador = 0;

	//	Temporizador
tempo_seg = 0;
tempo_fps = room_speed;

	//	Geração de obstáculos
obstaculo_asset_buffer = noone;
obstaculo_intervalo_t = 0; //2 * room_speed;



#endregion


//	Player
var spawn_x = camera_get_view_x(view_camera[0]) + 48;
var spawn_y = camera_get_view_y(view_camera[0]) + 128;
if(!instance_exists(obj_Player)) /*id_Player =*/ instance_create_layer(spawn_x, spawn_y, "Player", obj_Player);



