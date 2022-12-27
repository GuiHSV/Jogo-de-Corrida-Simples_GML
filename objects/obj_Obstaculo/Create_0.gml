
#region VARIVÁVEIS
//	Propriedades
//massa = ?;

//	Movimentação
velh = 0;

// Aparência
if(sprite_index == spr_obstaculo_teste)
{
	{/*} Incompleto
	mudar para isso ser decidido pelo controlador usando parametros como
	velocidade global e probabilidade.
	*/}
	var n = irandom(2);
	switch(n)
	{
		case 0:
			sprite_index = spr_cacto_P1;
		break;
		case 1:
			sprite_index = spr_cacto_G1;
		break;
		case 2:
			sprite_index = spr_cacto_G2;
		break;
	}
}
#endregion




