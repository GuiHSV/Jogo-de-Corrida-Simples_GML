
#region SISTEMA DE DIA E NOITE

#endregion





#region CRINADO TERRENO (!)
#endregion

#region CRIANDO OBSTÁCULOS (*)
if(obstaculo_delay < 1) //and (pode criar um obstáculo)
{
	/*var obstaculo = */instance_create_layer(480,128, "Obstaculos", obj_Obstaculo) //mudar para ser de acordo com a view
	//	Configurar obstáculo
	//with(obstáculo){}
	
	var delay = irandom_range(2, 7) / 2
	obstaculo_delay = room_speed * delay //variar mais intervalo
	show_debug_message(string(delay) + "'s até o proximo obstáculo.")
}
#endregion


