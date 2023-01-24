
#region SISTEMA DE DIA E NOITE (!)
//periodicamente troca a iluminação/cores do ambiente, é sinalizado para o jogador por um sol/lua que passa pela tela
#endregion


#region COMANDOS DO PLAYER
//Pause
if(keyboard_check_pressed(vk_escape))
{
	if(global.GameStatus == "Jogando") global.GameStatus = "Pausado"
	else if(global.GameStatus == "Pausado") global.GameStatus = "Jogando"
}

//Restart
if(global.GameStatus == "FimDeJogo") and (keyboard_check_pressed(vk_anykey)) obj_Controlador_Visual.resetando = true; //room_restart();
#endregion

#region OPERAÇÕES DO SISTEMA
	//	Algoritmo de terreno (*)
{/*}	RASCUNHO
	Pode ser:
	1. um algoritmo que decide o começo, meio e final do
	obstáculo de terreno e que pode criar outro um obstáculo normal ou
	de terreno em cima dele (algoritmo recursivo limitado, mais ou menos
	3 vezes)
	2. elevar ou abaixar o nivel o terreno em uma vez.	
*/}
/*if(terreno_timer < 1) and (obstaculo_intervalo_t < 1) and (...) gerar_terreno();
else*/ if !instance_position(room_width+32, chao_y, obj_Solido)
{
	instance_create_layer(room_width+32, chao_y, "Chao", obj_Solido,
	{
		sprite_index : asset_get_index("spr_solo_" + string(terreno_imagem) + "_" + string_lower(bioma)),
		corrigir_posicao : true
	});
	
	if(terreno_imagem = 3) terreno_imagem = 1;
	else terreno_imagem++;
}

	//	Gerar obstáculos
if(obstaculo_intervalo_t < 1) gerar_obstaculo();
#endregion


#region MOVIMENTAÇÃO GLOBAL
if global.GameStatus == "Jogando"
{	
	var velh = global.velhGlobal + velh_acumulador;
	repeat(velh)
	{
		with obj_Movel
		{
			#region INTERAÇÃO COM RAMPAS (!)
			#endregion
			
			x -= 1;
			
			if self.velh != 0
			{
				x -= sign(self.velh);
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
