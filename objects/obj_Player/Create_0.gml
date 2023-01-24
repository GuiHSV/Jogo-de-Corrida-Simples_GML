
#region VARIÁVEIS
	//	Propriedades
estado = "parado";
massa = 3;

	//	Movimentação
velv = 0;
//velh auxiliar. serve para o jogador conseguir alterar levemente a velocidade global

	//	Auxiliares
jump_buffer = 0;

//...

#endregion


colisao_solo = function(_direcao)
{
	var _y = y + _direcao;
	return collision_line(x-8,_y, x+2,_y, obj_Solido, false, true);
}
