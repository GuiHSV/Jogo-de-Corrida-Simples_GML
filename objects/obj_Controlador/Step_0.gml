
#region GERENCIADOR DE BUFFERS
global.velhGeral = velhGeral_inicial * multiplicador_velh;

if(obstaculo_delay > 0) obstaculo_delay--;
//...

#endregion

//if(global.jogoComecou == true) show_message("jogo começou: " + string(global.velhGeral));


#region CRINADO TERRENO (!)

#endregion


#region CRIANDO OBSTÁCULOS (*)
if(obstaculo_delay < 1) //and (pode criar um obstáculo)
{
	instance_create_layer(480,128, "Obstaculos", obj_Obstaculo) //mudar para ser de acordo com a view
	//Configurar obstáculo
	
	obstaculo_delay = room_speed * irandom_range(2, 6) / 2 //variar mais intervalo
}
#endregion


