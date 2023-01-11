
#region SISTEMA DE DIA E NOITE (!)
//periodicamente troca a iluminação/cores do ambiente, é sinalizado para o jogador por um sol/lua que passa pela tela
#endregion


#region OPERAÇÕES
//sistema de pause
{/*} RASCUNHO
	quando se preciona "Esc" quando o "global.GameStatus" for igual
	a "Jogando" ele troca para "Pausado" e vice-versa. Com isso
	a movimentação global é parada junto da contagem de todos os
	buffers.
*/}
if(keyboard_check_pressed(vk_escape))
{
	if(global.GameStatus == "Jogando") global.GameStatus = "Pausado"
	else if(global.GameStatus == "Pausado") global.GameStatus = "Jogando"
}

//algoritmo de terreno
{/*}	RASCUNHO
	Pode ser:
	1. um algoritmo que decide o começo, meio e final do
	obstáculo de terreno e que pode criar outro um obstáculo normal ou
	de terreno em cima dele (algoritmo recursivo limitado, mais ou menos
	3 vezes)
	2. elevar ou abaixar o nivel o terreno em uma vez.	
*/}

if(global.GameStatus == "FimDeJogo") and (keyboard_check_pressed(vk_anykey)) game_restart();

if(obstaculo_intervalo_t < 1) gerar_obstaculo();
#endregion


#region MOVIMENTAÇÃO GLOBAL
if global.GameStatus == "Jogando" //or global.GameStatus == "Transição"
{	
	var velh = global.velhGlobal + other.velh_acumulador;
	repeat(velh)
	{
		with obj_Movel
		{
			#region INTERAÇÃO COM RAMPAS (!)
			#endregion
			
			x -= 1;
			if self.velh != 0
			{
				x -= self.velh;
				self.velh -= sign(self.velh)
			}
		
			if(place_meeting(x,y, obj_Player)) global.GameStatus = "FimDeJogo";;
		}
		if(global.GameStatus == "FimDeJogo") break;
	}
		
	//	Reaproveitamento da parte fracionada
	var velh = global.velhGlobal;
	if(floor(velh) < floor(velh + velh_acumulador)) velh_acumulador -= 1 - frac(velh);
	else if(frac(velh) != 0) velh_acumulador += frac(velh);
}
#endregion
