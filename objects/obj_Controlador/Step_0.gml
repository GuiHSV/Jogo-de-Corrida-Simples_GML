
#region SISTEMA DE DIA E NOITE

#endregion

if(global.jogoComecou) moveH_geral();

#region CRINADO TERRENO (!)
//	PODE:
//	OU
//algoritmo que decide o começo, meio e final do obstáculo de terreno que pode criar outro
//um obstáculo normal ou de terreno em cima dele (algoritmo recursivo limitado)
//	OU
//elevar ou abaixar o nivel do terreno
#endregion

#region CRIANDO OBSTÁCULOS (*)
if(obstaculo_delay < 1) //and false //and (pode criar um obstáculo)
{
	var view_x = camera_get_view_border_x(view_camera[0]);
	var view_y = camera_get_view_border_y(view_camera[0]); //incompleto
	/*var obstaculo = */instance_create_layer(view_x+480, view_y+160, "Obstaculos", obj_Obstaculo)
	//	Configurar obstáculo
	//with(obstáculo){}
	
	var delay = irandom_range(2, 7) / 2
	obstaculo_delay = room_speed * delay
	show_debug_message(string(delay) + "'s até o proximo obstáculo.")
}
#endregion


