
{/*}	O que fazer amanhã: passo a passo.
	
	1.[X] Aumentar o tanho da câmera para pegar toda a tela
		1.1(X) talvez pegar antes as cordenadas da área da câmera antiga
	2.[X] Criar as barras pretas que ficam em cima e em baixo cobrindo a visão
		2.1(X) intro inicial delas abrindo a tela inteira
		2.2(X) fechando a visão para o normal quando o jogo começar
		2.3(X) adaptar os detalhes da hud (e decidir de vez o que vai ter nela) para esse novo formato
	3.[ ] Finalizar o design da tela quando _global.GameStatus == "Pronto"_
		3.1( ) talvez adicionar um botão que exiba os controles (usar um objeto para deixar o código por fora dos controladores)
		3.2( ) mostrar melhor pontuação
		3.3( ) crêditos e versão atual do jogo
		3.4( ) botão de sair e etc...
	4.[ ] Ajustar a hud quando _global.GameStatus == "Jogando"_
		4.1(X) fazer as barras pretas se ajustarem para cobrir a telas como a câmera atual e colocar a hud na
		parte preta (semelhante a jogos antigos) poder ficar muito bacana
	5.[ ] Melhorar design das telas quando _global.GameStatus == "Pausado" ou "FimDeJogo"_ (deixar a tela mais
	escura e fechar a tela com as barras como um transição podem ser boas opções)
	6.[ ] Modificar os Sprites dos obstáculo, Player, Outro Pássaro e o que ainda estiver faltando
	7.[ ] Ajustar o parallax de fundo
		7.1( ) ajustar as cores do backgroud com a dos cactos e do player para não causar confusão
		7.2( ) finalizar o backgroud com alguns ajustes (como melhorar o parallax perto e fazer mais parallax's de nuvens)
	8.[ ] Balancear a velocidade com a criação de obstáculos e o incremento do multiplicador
	9.[ ] Ver como fazer um sistema decente de Dia e Noite (Apenas colocar uma cor escura por cima ou adicionar filtros aos sprites manualmente)
	
	10.[ ] Implementar os obstáculos de terreno
		10.1( ) ... os mais simples
		10.2( ) ... os mais complexos
	11.[ ] Trabalhar na troca de Biomas
		11.1( ) começar com variações do Bioma de deserto
		11.2( ) fazer um Bioma novo com obstáculos diferentes
	12.[ ] Eventos de Gameplay
	
	*/{/*}	POSSIVEIS EVENTOS QUE PODEM OCORRER DURANTE A GAMEPLAY
	
		1.(Dificil pra caramba) Após troca de bioma (quando implementado) poder surgir o "Cacthulo"
		no deserto a noite, sendo uma curta boss fight de sobrevivencia
		(referência a "Terraria")
	
		2.(Opcional) Made in Heaven (Jojo parte 6)
	
		3.(Fácil fazer) Outro Passaro aparece apenas como distração
	
		4.(Muito opcional) Troca de Bioma (e estilo visual) para a entrada do castelo de
		Castelvania 1
	
		5. Stardust Speedway: Zone 3 (Sonic CD)
	*/}/*
	
*/}


#region VARIÁVEIS
	//	Propriedades
meioTela_y = room_height div 2;
barraSup_y = meioTela_y;
barraInf_y = meioTela_y;
//raioCirculo = room_width;
HudAtivada = false;
pontuacao_texto = "";
HudAtivada_timer = 0;

	//
srf_visual = surface_create(room_width, room_height);
#endregion


#region DESENHAR TEXTO PRINCIPAL (!)
//Melhor transformar esse metodo em uma função
//Talvez seja interessante criar metodos auxiliares como "desenhar_texto_simples"
desenhar_texto = function(texto_x, texto_y, texto, alinhamento, escala, cor1, cor2, SempreAtivo)
{
	if HudAtivada or SempreAtivo
	{
		draw_set_font(font_texto);
		draw_set_halign(alinhamento);
		draw_set_valign(fa_middle);
		
		draw_text_transformed_color(texto_x, texto_y, texto, escala, escala, 0, cor1, cor1, cor2, cor2, 1);
		
		draw_set_valign(-1);
		draw_set_halign(-1);
		draw_set_font(-1);
	}
}
#endregion

