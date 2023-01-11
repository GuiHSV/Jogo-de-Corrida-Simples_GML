randomize();

#region	VARIÁVEIS
	//	Propriedades Globais
global.GameStatus = "Iniciado";
{/*}	global.GameStatus
	"Iniciado"
	"Jogando"
	"Pausado"
	"FimDeJogo"
	"Transição"
*/}
nivelChao = 60; //32 + 28
bioma = "_deserto";
{/*}	Biomas
	Bioma:
		*_sub_bioma (..._variação)
			obstáculos (tipo e frequência/variação)
			
	Deserto:
		*_arenoso (...tempestade de areia)
			cactos (fixo, padrão/raro quando tempestade)
			dunas e rochas (solidos, ocasional)
			bola de feno (móvel, raro/padrão quando tempestade)
		*_montanhoso
			cactos (fixo, padrão)
			dunas e rochas (solidos, padrão)
	Floresta
		*_savana
		*_pantano
		*_tropical (..._chuvosa)
	Montanha
		*_normal
		//...
	Templo_grego
*/}
pontuacao = 0;

	//	Movimentação Global
multiplicador = 1;
velh_acumulador = 0;

	//	Temporizador
tempo_seg = 0;
tempo_fps = room_speed;

	//	Geração de obstáculos
obstaculo_asset_buffer = noone;
obstaculo_intervalo_t = 0;

	//	Extras
tempo_piscar_hud = 0;

#endregion

//	Player
var spawn_x = camera_get_view_x(view_camera[0]) + 48;
var spawn_y = camera_get_view_y(view_camera[0]) + 128;
if(!instance_exists(obj_Player)) instance_create_layer(spawn_x, spawn_y, "Player", obj_Player);


#region DESENHAR PONTUAÇÃO
{/*} NOTA:
	Desenhar a melhor pontuação (caso haja) em cima da pontuação aual
	Futuramente, caso seja implementado algum chefe, o número da pontuação
	será substituído pelo tempo até a luta acabar, que será contado da mesma
	forma que a pontuação, porém de forma decrescente. Quando o tempo chegar
	a zero a pontuação voltará a ser contada normalmente *de onde parou*, mas
	com o jogador ganhando um incremento por ter sobrevivido ao chefe.
*/}
desenhar_pontuacao = function()
{
	if tempo_piscar_hud < room_speed/2
	{
		{//}	Ajustes
			var text_x = room_width;
			var text_y = camera_get_view_y(view_camera[0]);
	
			draw_set_color(c_white)
			draw_set_alpha(.5)
	
			draw_rectangle(text_x-19, text_y+4, text_x-86, text_y+12, false);
	
			draw_set_alpha(1)
			draw_set_color(c_black)
			draw_set_font(fonte_principal)
			draw_set_halign(fa_right)
			draw_set_valign(fa_top)
		}
	
		var _pontuacao = "";
		for(var i = 7; i >= 0; i--)
		{
			var casa_decimal = potenciacao(10, i)
			if pontuacao div casa_decimal >= 1
			{
				_pontuacao += string(pontuacao)
				break;
			}
			else _pontuacao += "0"
		}
		draw_text_transformed(text_x-20, text_y+5, _pontuacao, .5, .5, 0);
	
		{//}	Ajustes
			draw_set_valign(-1);
			draw_set_halign(-1);
			draw_set_font(-1);
			draw_set_color(-1);
		}
	}
}
#endregion


#region DESENHAR
desenhar_texto = function(_isPiscando, _texto)
{
	if !_isPiscando or tempo_piscar_hud < room_speed/2
	{
		draw_set_color(c_black)
		draw_set_font(fonte_principal)
		draw_set_halign(fa_center)
		draw_set_valign(fa_middle)
		
		draw_text(room_width/2, room_height/2, _texto)
		
		draw_set_halign(-1)
		draw_set_valign(-1)
		draw_set_font(-1)
		draw_set_color(-1)
	}
}
#endregion
