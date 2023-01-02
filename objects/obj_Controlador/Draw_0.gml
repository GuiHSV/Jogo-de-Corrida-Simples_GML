
var view_x = camera_get_view_x(view_camera[0]);
var view_y = camera_get_view_y(view_camera[0]);

draw_set_color(c_black);
draw_text(view_x+10,view_y, "seg: " + string(tempo_seg))
draw_text(view_x+10,view_y+15, "buffer: " + string(tempo_buffer))
draw_text(view_x+10,view_y+30, "multiplicador: " + string(multiplicador) + " | velhGlobal: " + string(global.velhGlobal))
draw_set_color(-1);

#region DESENHA PONTUAÇÃO (!)
//desenha pontuação

{/*} NOTA:
	futuramente, caso seja implementado algum chefe, o número da pontuação
	será substituído pelo tempo até a luta acabar, que será contado da mesma
	forma que a pontuação, porém de forma decrescente. Quando o tempo chegar
	a zero a pontuação voltará a ser contada normalmente, mas com o jogador
	ganhando uma pontuação extra por ter sobrevivido ao chefe.
*/}
#endregion

#region DESENHA EXTRA (!)
//Desenha botão de iniciar quando player estiver parado

//Desenha tela de pause quando pausado

//Desenha tela de game over/restart quando jogador morrer

#endregion



