


#region VARIVÁVEIS
//sprite_index = spr_obst_M_deserto
if sprite_index == spr_obst_M_deserto
{	
		//	Propriedades
	isMovel = true;
	//massa = 1; //choose(1, 2)
	angulo = 0;
	
		//	Movimentação
	velh_inicial = 1; ////choose(2, 1, -1);
	//velv = 0;
	//vel_jump = 1 + 4 * (massa-1);
	
	y -= sprite_height/2;
}
else isMovel = false;

#endregion


colisao_solo = function(_direcao)
{
	var _y = y + (sprite_height/2 * _direcao)
	
	draw_set_color(c_red);
	draw_point(x, _y); //y+sprite_height+_direcao)
	draw_set_color(-1);
}
