
#region
if HudAtivada_timer < 1
{
	HudAtivada = !HudAtivada;
	HudAtivada_timer = room_speed/4;
}
else HudAtivada_timer--;

#endregion


#region GERENCIAR PARALLAX (*)
{/*}	Nota:
	Dividir o parallax de nuvens em outros três parallaxes:
	Um de nuvens no horizonte (mais lento)
	Nuvens Grandes (Normal)
	Nvens pequenas (Mais rápido)
*/}

if(abs(x) >= room_width) x += room_width;
var parallax_solo = layer_get_id("Parallax_Solo");
layer_x(parallax_solo, x);

var parallax, veloc;
if global.GameStatus == "Jogando"
{
	parallax = layer_get_id("Parallax_Perto");
	veloc = lerp(0, global.velhGlobal, .6);
	layer_hspeed(parallax, -veloc);
	
	parallax = layer_get_id("Parallax_Longe");
	veloc = lerp(0, global.velhGlobal, .3);
	layer_hspeed(parallax, -veloc);
	
	parallax = layer_get_id("Parallax_Nuvens");
	veloc = lerp(0, global.velhGlobal, .1);
	layer_hspeed(parallax, -veloc);
}
else
{
	var parallax_nome = ["Parallax_Perto", "Parallax_Longe", "Parallax_Nuvens"];
	for(var i = 0; i < 3; i++)
	{
		if(global.GameStatus != "Pausado") and (i == 2) veloc = .01;
		else veloc = 0;
		parallax = layer_get_id(parallax_nome[i]);
		layer_hspeed(parallax, -veloc);
	}
}
#endregion

