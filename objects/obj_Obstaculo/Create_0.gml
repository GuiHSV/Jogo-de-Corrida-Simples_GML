


#region VARIVÁVEIS
//sprite_index = spr_obst_M_deserto
if sprite_index == spr_obst_M_deserto
{
	show_message("é um objeto móvel")
	
		//	Propriedades
	isMovel = true;
	massa = 1; //choose(1, 2)
	angulo = 0;
	
		//	Movimentação
	velh_inicial = 1; ////choose(2, 1, -1);
	//velv = 0;
	//vel_jump = 1 + 4 * (massa-1);
	
	y -= sprite_height/2;
}
else isMovel = false;

#endregion


colisao_solo = function()
{
	return false;
}
