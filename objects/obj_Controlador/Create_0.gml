
#region	VARIÁVEIS
//	Propriedades Globais
global.jogoComecou = false;
//bioma = "deserto";
{/*}
	deserto
	deserto_montanhoso
	deserto_tornado
	floresta_savana
	floresta_tropical
	floresta_chuvosa
	montanha
	templo
*/}

//	Movimentação Global
velhGeral_inicial = -2;
multiplicador_velh = 1;

//	Buffers
//terreno_delay = 10 * room_speed;
obstaculo_delay = 4 * room_speed;

if(!instance_exists(obj_Player)) /*id_Player =*/ instance_create_layer(48, 128, "Player", obj_Player); //mudar para ser de acordo com a view
else show_message("Há mais de um obj do player! Algo está errado...");
#endregion



