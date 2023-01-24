// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

{/*}	O que fazer amanhã: passo a passo.
	
	1.[X] Aumentar o tanho da câmera para pegar toda a tela
		1.1(X) talvez pegar antes as cordenadas da área da câmera antiga
	2.[X] Criar as barras pretas que ficam em cima e em baixo cobrindo a visão
		2.1(X) intro inicial delas abrindo a tela inteira
		2.2(X) fechando a visão para o normal quando o jogo começar
		2.3(X) adaptar os detalhes da hud (e decidir de vez o que vai ter nela) para esse novo formato
	3.[ ] Finalizar o design da tela quando _global.GameStatus == "Pronto"_		(DEIXAR PRA DEPOIS)
		3.1( ) talvez adicionar um botão que exiba os controles (usar um objeto para deixar o código por fora dos controladores)
		3.2( ) mostrar melhor pontuação
		3.3( ) crêditos e versão atual do jogo
		3.4( ) botão de sair e etc...
		3.5( ) configurações
	4.[ ] Ajustar a hud quando _global.GameStatus == "Jogando"_
		4.1(X) fazer as barras pretas se ajustarem para cobrir a telas como a câmera atual e colocar a hud na
		parte preta (semelhante a jogos antigos) poder ficar muito bacana
		4.2( ) Adicionar: Velocidade atual, tempo de jogo, pontuação atual, melhor pontuação, nome do mapa, etc...
	5.[ ] Melhorar design das telas quando _global.GameStatus == "Pausado" ou "FimDeJogo"_ (deixar a tela mais
	escura e fechar a tela com as barras como um transição podem ser boas opções)
	6.[ ] Modificar os Sprites dos obstáculo, Player, Outro Pássaro e o que ainda estiver faltando
	7.[ ] Ajustar o parallax de fundo
		7.1( ) ajustar as cores do backgroud com a dos cactos e do player para não causar confusão
		7.2( ) finalizar o backgroud com alguns ajustes (como melhorar o parallax perto e fazer mais parallax's de nuvens)
	8.[ ] Terminar a programação do obstáculo móvel
		8.( ) implementar um acumulador de velocidade vertical tal qual existe na movimentação horizontal global
	9.[ ] Balancear a velocidade com a criação de obstáculos e o incremento do multiplicador
	10.[ ] Ver como fazer um sistema decente de Dia e Noite (Apenas colocar uma cor escura por cima ou adicionar filtros aos sprites manualmente)

	11.[ ] Implementar os obstáculos de terreno
		11.1( ) ... os mais simples
		11.2( ) ... os mais complexos
	12.[ ] Trabalhar na troca de Biomas
		12.1( ) começar com variações do Bioma de deserto
		12.2( ) fazer um Bioma novo com obstáculos diferentes
	13.[ ] Eventos de Gameplay*/
	
	{/*}	POSSIVEIS EVENTOS QUE PODEM OCORRER DURANTE A GAMEPLAY
	
		1.(Dificil pra caramba) Após troca de bioma (quando implementado) poder surgir o "Cacthulo"
		no deserto a noite, sendo uma curta boss fight de sobrevivencia
		(referência a "Terraria")
	
		2.(Opcional) Made in Heaven (Jojo parte 6)
	
		3.(Fácil fazer) Outro Passaro aparece apenas como distração
	
		4.(Muito opcional) Troca de Bioma (e estilo visual) para a entrada do castelo de
		Castelvania 1
	
		5. Stardust Speedway: Zone 3 (Sonic CD)
		
		6. Distrações aleatórias
	*/}/*
	
*/}



#macro GRAVIDADE .1
#macro VELH_INICIAL 2

#region FUNÇÕES AUXILIARES
function potenciacao(_numero, _expoente)
{
	if(_expoente == 0) and (_numero != 0) return 1;
	
	var _resultado = _numero;
	repeat(_expoente-1)	_resultado = _resultado * _numero;
	return _resultado;
}

function desenhar_texto(_x, _y, texto, alinhamento, escala, cor1, cor2, SempreAtivo) //Adicionar mais coisa
{
	var _HudAtivada = obj_Controlador_Visual.HudAtivada;
	if _HudAtivada or SempreAtivo
	{
		draw_set_font(font_texto);
		draw_set_halign(alinhamento);
		draw_set_valign(fa_middle);
		
		draw_text_transformed_color(_x, _y, texto, escala, escala, 0, cor1, cor1, cor2, cor2, 1);
		
		draw_set_valign(-1);
		draw_set_halign(-1);
		draw_set_font(-1);
	}
}

function desenhar_texto_simples(_x, _y, texto, alinhamento, cor, SempreAtivo)
{
	desenhar_texto(_x, _y, texto, alinhamento, .5, cor, cor, SempreAtivo);
}
#endregion



function gravidade() //será usado por: player, bola de feno, outroPassaro e outras coisas
{
	with(other)	if(global.GameStatus == "Jogando") and (!chao) velv += massa * GRAVIDADE;
}

#region MOVIMENTAÇÃO VERTICAL
function movimentacao_vertical()
{
	with(other)
	{
		var _velv = sign(velv);
		repeat(abs(velv))
		{
			if colisao_solo(_velv) 
			{
				velv = 0;
				break;
			}
	
			y += _velv;
		}
	}
	
	//acumulador de parte fracionária
}
#endregion
