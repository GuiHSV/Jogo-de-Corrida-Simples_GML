
{//} informações extra
	
	var view_x = camera_get_view_x(view_camera[0]);
	var view_y = camera_get_view_y(view_camera[0]);

	draw_set_color(c_black);
	draw_text(view_x+10,view_y, "seg: " + string(tempo_seg) + "  |  buffer: " + string(tempo_fps))
	draw_text(view_x+10,view_y+15, "velocidade: " + string(global.velhGlobal) + " | multiplicador: " + string(multiplicador))
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
		//melhor pontução
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
		desenhar_texto(true, "Pause")
		
		break;
	}
	
	case "FimDeJogo":
	{
		//pontuação piscando e "GAME OVER" na tela
		desenhar_texto(false, "Game Over")
		
		break;
	}
	
	case "Transição":
	{
		//mesma coisa do "Jogando"
		break;
	}
}
#endregion


