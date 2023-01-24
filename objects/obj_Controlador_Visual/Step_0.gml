
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

#region PEGA TEMPO DE JOGO
tempo_texto = "";
with(obj_Controlador)
{
	var minuto = string(tempo_seg div 60);
	if(string_length(minuto) == 1) minuto = "0" + minuto;
	
	var segundo = string(tempo_seg mod 60);
	if(string_length(segundo) == 1) segundo = "0" + segundo;
	
	other.tempo_texto = minuto + ":" + segundo;
}
#endregion


#region MANIPULAÇÃO DAS BARRAS PRETAS
switch(global.GameStatus)
{
	case "Iniciando":
	case "FimDeJogo":
	{
		if barraSup_y != 0 or barraInf_y != room_height
		{
			barraSup_y = floor(lerp(barraSup_y, 0, .1));
			barraInf_y = ceil(lerp(barraInf_y, room_height, .1));
		}
		else
		{
			if global.GameStatus == "Iniciando"
			{
				global.GameStatus = "Pronto";
				meioTela_y = 144;
			}
			else if resetando
			{
				raioCirculo = lerp(raioCirculo, 0, .1);
				if(raioCirculo < .1) game_restart();
			}
		}
		break;
	}
	
	case "Jogando":
	{
		if barraSup_y != 64 or barraInf_y != 224
		{
			barraSup_y = ceil(lerp(barraSup_y, 64, .1));
			barraInf_y = floor(lerp(barraInf_y, 224, .1));
		}
		break;
	}
}
#endregion
