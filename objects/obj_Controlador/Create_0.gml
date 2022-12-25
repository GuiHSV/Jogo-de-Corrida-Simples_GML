
#region	VARIÁVEIS
//	Propriedades Globais
global.jogoComecou = false;
//bioma = "deserto";
{/*}
PROPOSTAS DE BIOMAS
	deserto:
		*_arenoso
		*_montanhoso
		*_tornado
	floresta
		*_savana
		*_tropical (chuvosa)
		*_...
	montanha
		*_normal
		*_...
	templo_grego
*/}

//	Movimentação Global
velhGeral_inicial = -2;
multiplicador_velh = 1;

//	Buffers
//terreno_delay = 10 * room_speed;
obstaculo_delay = 4 * room_speed;

//	Player
var view_x = camera_get_view_border_x(view_camera[0]);
var view_y = camera_get_view_border_y(view_camera[0]);
if(!instance_exists(obj_Player)) /*id_Player =*/ instance_create_layer(view_x+48, view_y+160, "Player", obj_Player);
//else show_message("Há mais de um obj do player! Algo está errado...");

#endregion



