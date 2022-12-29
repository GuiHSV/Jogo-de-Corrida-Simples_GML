
#region SISTEMA DE DIA E NOITE (!)
//periodicamente troca a iluminação/cores do ambiente, é sinalizado para o jogador por um sol/lua que passa pela tela
#endregion



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
	var spawn_x = camera_get_view_width(view_camera[0]) *1.2;
	var spawn_y = camera_get_view_y(view_camera[0]) + 128;//incompleto
	/*var obstaculo = */instance_create_layer(spawn_x, spawn_y, "Obstaculos", obj_Obstaculo)
	//	Configurar obstáculo. (carregar obstáculos mais difíceis conforme o tempo passa)
	//with(obstáculo){}
	
	var delay = irandom_range(2, 7) / 2
	obstaculo_delay = room_speed * delay //* (modificador/2 + .5);
	show_debug_message(string(delay) + "'s até o proximo obstáculo.")
}
#endregion



#region MOVIMENTAÇÃO GLOBAL (***)
{/*} Problema .1
	PROBLEMA: Provável que a colisão não seja visualmente perceptivel ou pareça
	errada em altas velocidades pois, como os obstáculos se movem exatamente
	vários pixels por frame, quando o obj_Player realizar o estado "morto" no
	frame seguinte da colisão o obstáculo já pode estar muito distante dele,
	fazendo parecer que a colisão foi feita de forma errada.
	SOLUÇÕES:
	1. Ignorar caso não seja tão grave
	2. Reestruturar o código para ele instantaneamente parar o movimneto global
	no exato momento da colisão
	3. Causar um evento específico (animação do player caindo e se arrastando
	no chão) quando ocorrer a colisão (em vez de apenas pausar "na hora"),
	assim o player apenas sabe que houve uma colisão em vez de ver o momento 
	levemente atrasado.
*/}
{/*} Problema .2
	PROBLEMA: A mudança de velocidade é muito perceptível pois a velocidade
	apenas conta a parte inteira.
	SOLUÇÃO: É necessário implementar código que reaproveite a parte fracionada
	de "velh".
*/}
if global.GameStatus == "Jogando"
{
	with obj_Obstaculo
	{
		var velh = global.velhGlobal + self.velh;
		//var abs_velh = abs(velh);
		
		//var _velh = sign(velh);
		repeat(abs(velh + velh_acumulador))
		{
			#region INTERAÇÃO COM RAMPAS (!)
			/*if object_get_name(object_index) == "obj_Solido_movel" //tentar ver se "if object_get_name(id)" funciona
			{
				//CÁDIGOS VINDOS DO PLAYER, NÃO ADAPTADOS PRO OBJ_SOLIDO_MOVEL
				//faz player subir rampa
				if place_meeting(x+_velh, y, obj_Solido) and !place_meeting(x+_velh, y-1, obj_Solido)
				{
					y--;
				}
				//faz player descer rampa
				if !place_meeting(x+_velh, y, obj_Solido) and !place_meeting(x+_velh, y+1, obj_Solido) and !place_meeting(x+_velh, y+2, obj_Solido)
				{
					y++;
				}
			}//*/
			#endregion
			
			x -= 1;
			if place_meeting(x,y, obj_Player)
			{
				obj_Player.estado = "morto";
				//break; ?
			}
		}
		
		//se o acumulador fez diferença, retirar essa parte dele
		//se sobra algo (o acumulador não fez diferença), adiciona ao acumulador
		
		//CONTINUAR DAQUI
		if floor(velh) < floor(velh + velh_acumulador) //se o acumulador fez alguma diferença
		{
			show_debug_message("acumulador fez diferença")
			velh_acumulador -= 1 - frac(velh);
		}
		else if frac(velh) != 0
		{
			show_debug_message("sobrou: " + string(frac(velh)))
			velh_acumulador += frac(velh)
		}
		
	}
}
#endregion
