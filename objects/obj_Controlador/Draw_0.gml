
{//} informações extra
	
	var view_x = camera_get_view_x(view_camera[0]);
	var view_y = camera_get_view_y(view_camera[0]);

	draw_set_color(c_black);
	draw_text(view_x+10,view_y,  "veloc(" +  string(global.velhGlobal) + ") mult(" + string(multiplicador) + ") tempo(" + string(tempo_seg) + " - " + string(contador_fps) + ")")
	//draw_text(view_x+10,view_y+15, "velocidade: " + string(global.velhGlobal) + " | multiplicador: " + string(multiplicador))
	draw_text(view_x+10,room_height-48, string(obstaculo_intervalo_t))
	draw_set_color(-1);
}



#region DESENHA HUD (!)
//Desenha botão de iniciar quando player estiver parado

//Desenha tela de pause quando pausado

//Desenha tela de game over/restart quando jogador morrer

desenhar_pontuacao();
switch(global.GameStatus)
{
	case "Iniciado":
	{
		desenhar_texto("Precione SPACE para iniciar", true, false, .5, c_gray, c_black)
		
		//melhor pontução
		
		//versão
		
		//configurações
		
		//título
		break;
	}
	
	case "Jogando":
	{
		//pontuação e talvez a velocidade
		break;
	}
	
	case "Pausado":
	{
		//pontuação e frase "PAUSE" piscando simultaneamente
		desenhar_texto("Pause", true, true,  1, c_white, c_ltgray)
		
		break;
	}
	
	case "FimDeJogo":
	{
		//pontuação piscando e "GAME OVER" na tela
		desenhar_texto("Game Over", false, true, 1, c_dkgray, c_black)
		
		break;
	}
	
	case "Transição":
	{
		//mesma coisa do "Jogando"
		break;
	}
}
#endregion


