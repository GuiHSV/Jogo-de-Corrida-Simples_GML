
#region VARIÁVEIS
desenha_fundo = choose(false, false, true);
if(desenha_fundo)
{
	var _numero = choose("1_", "1_", "2_", "2_", "3_");
	sprite_buffer = asset_get_index("spr_fundo_" + _numero + string_lower(obj_Controlador.bioma));
}
#endregion

	//	Corrige posição
while !collision_line(x-1,y, x-1,y+sprite_height, obj_Solido, false, true) and corrigir_posicao
{
	x--;
}

