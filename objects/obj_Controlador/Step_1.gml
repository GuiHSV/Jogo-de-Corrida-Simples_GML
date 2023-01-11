
#region TEMPORIZADOR (*)
if global.GameStatus == "Jogando"
{
	if tempo_fps == 0
	{
		tempo_seg++;
		tempo_fps = room_speed;
		if(tempo_seg mod 2 == 0) multiplicador += .05; //balancear melhor a adição do multiplicador
		if(tempo_fps mod abs(room_speed/10) == 0) pontuacao++;
	}
	else tempo_fps--;
	
	if(tempo_fps mod abs(room_speed/10) == 0) pontuacao++;
}
#endregion


#region GERENCIADOR DE VARIÁVEIS
global.velhGlobal = VELH_INICIAL * multiplicador; // + velocidade_auxiliar do player;

if(global.GameStatus == "Jogando") and (obstaculo_intervalo_t > 0) obstaculo_intervalo_t--;

if global.GameStatus == "Pausado" or global.GameStatus == "FimDeJogo"
{
	if(tempo_piscar_hud > 0) tempo_piscar_hud -= 2;
	else tempo_piscar_hud = room_speed;
}
else tempo_piscar_hud = 0;
//...

#endregion


#region PARALLAX
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
		if(i == 2) veloc = .01;
		else veloc = 0;
		parallax = layer_get_id(parallax_nome[i]);
		layer_hspeed(parallax, -veloc);
	}
}
#endregion


