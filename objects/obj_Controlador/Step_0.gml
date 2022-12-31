
#region SISTEMA DE DIA E NOITE (!)
//periodicamente troca a iluminação/cores do ambiente, é sinalizado para o jogador por um sol/lua que passa pela tela
#endregion



#region CRINADO TERRENO (!)
{/*}	RASCUNHO
	Pode executar OU um algoritmo que decide o começo, meio e final do
	obstáculo de terreno e que pode criar outro um obstáculo normal ou
	de terreno em cima dele (algoritmo recursivo limitado, mais ou menos
	3 vezes) OU elevar ou abaixar o nivel o terreno em uma vez.	
*/}
#endregion

#region CRIANDO OBSTÁCULOS (*)
if(obstaculo_delay < 1) //and false //and (pode criar um obstáculo)
{
	
	{/*}	RASCUNHO
		Algoritmo que escolhe aleatoriamente o obstáculo a ser gerádo,
		levar em consideração o tempo de jogo para gerar obstáculos
		mais difíceis.
		
		PROTÓTIPO:
		se passou_de_algum_tempo_específico, então adiciona strings (nome do obstáculo) no array_de_strings
		
		se obstaculo_delay < 1
			cria obstáculo no nivel do chão atual e fora da tela
			var nome_obstáculo = choose(array_de_strings)
			switch(nome_obstáculo)
				configura obstáculo de acordo com a opção selecionada
			define delay até próximo obstáculo (intervalo fica levemente menor conforme a velocidade aumenta)
	*/}
	
	var spawn_x = camera_get_view_width(view_camera[0]) *1.2;
	var spawn_y = camera_get_view_y(view_camera[0]) + 128; //+ nivel do chão
	/*var obstaculo = */instance_create_layer(spawn_x, spawn_y, "Obstaculos", obj_Obstaculo)
	//	Configurar obstáculo. (carregar obstáculos mais difíceis conforme o tempo passa)
	//with(obstáculo){}
	
	var delay = irandom_range(2, 6) / 2 //alterar para gerar um pouco mais rápido em velocidades maiores
	obstaculo_delay = room_speed * delay
	show_debug_message(string(delay) + "'s até o proximo obstáculo.")
}
#endregion



#region MOVIMENTAÇÃO GLOBAL (**)
{/*} Problema .1 (Baixa Prioridade)
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
{/*} Problema .2 (Resolvido)
	PROBLEMA: A mudança de velocidade é muito perceptível pois a velocidade
	apenas conta a parte inteira.
	SOLUÇÃO: É necessário implementar código que reaproveite a parte fracionada
	de "velh".
*/}
if global.GameStatus == "Jogando"
{
	with obj_Obstaculo //NOTA: Criar um objeto mais abstráto para tratar todos os que se movem?
	{
		//	Movimentação e colisão dos obstáculos
		var velh = global.velhGlobal + self.velh;
		repeat(velh + velh_acumulador)
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
			}
		}
		//	Reaproveitamento da parte fracionada
		if(floor(velh) < floor(velh + velh_acumulador)) velh_acumulador -= 1 - frac(velh);
		else if(frac(velh) != 0) velh_acumulador += frac(velh);
	}
}
#endregion
