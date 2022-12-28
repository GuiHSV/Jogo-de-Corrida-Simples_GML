
#region	VARIÁVEIS
//	Propriedades Globais
global.GameStatus = "Iniciado";
//bioma = "deserto";
{/*}
PROPOSTAS DE BIOMAS
	Bioma:
		*_sub_bioma (..._variação)
			obstáculos (tipo e frequência/variação)
			
	Deserto:
		*_arenoso (..._tornado)
			cactos (fixo, padrão/ocasional quando tornado)
			dunas e rochas (solidos, ocasional)
			bola de feno (móvel, raro/padrão quando tornado)
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

//	Velocidade Global
multiplicador = 1;

//	Buffers
tempo_seg = 0;
tempo_buffer = room_speed;

//terreno_delay = 10 * room_speed;
obstaculo_delay = 3 * room_speed;

#endregion


//	Player
var spawn_x = camera_get_view_x(view_camera[0]) + 48;
var spawn_y = camera_get_view_y(view_camera[0]) + 128;
if(!instance_exists(obj_Player)) /*id_Player =*/ instance_create_layer(spawn_x, spawn_y, "Player", obj_Player);
//else show_message("Há mais de um obj do player! Algo está errado...");



