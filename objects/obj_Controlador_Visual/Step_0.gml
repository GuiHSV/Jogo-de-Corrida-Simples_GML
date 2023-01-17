
{/*}	Objetivo
	
	controlar totalmente a parte visual concentrando todo o código aqui
	para não poluir demais o obj_Controlador.
	
	Funções:
	[ ] criar e manipular as barras pretas da tela (ainda não implementado)
	[ ] metodos (acessiveis pelo obj_Controlador) que controlem a hud do jogo em seus diversos estados (global.GameStatus)
	
	//Desenvolver as barras pretas manipulaveis

	//Desenvolver sistema de Hud
*/}

#region PEGA PONTUAÇÃO
pontuacao_texto = "";
with(obj_Controlador)
{
	for(var i = 7; i >= 0; i--)
	{
		var casa_decimal = potenciacao(10, i);
		if pontuacao div casa_decimal >= 1
		{
			other.pontuacao_texto += string(pontuacao);
			break;
		}
		else other.pontuacao_texto += "0";
	}
}
#endregion

switch(global.GameStatus)
{
	case "Iniciando":
	case "FimDeJogo":
	{
		barraSup_y = floor(lerp(barraSup_y, 0, .1));
		barraInf_y = ceil(lerp(barraInf_y, room_height, .1));
		if global.GameStatus == "Iniciando" and barraSup_y == 0 and barraInf_y == room_height
		{
			global.GameStatus = "Pronto";
			meioTela_y = 144;
		}
		break;
	}
	
	case "Jogando":
	{
		//if barraSup_y != 64 or barraSup_y != 224
		{
			barraSup_y = ceil(lerp(barraSup_y, 64, .1));
			barraInf_y = floor(lerp(barraInf_y, 224, .1));
		}
		break;
	}
}

