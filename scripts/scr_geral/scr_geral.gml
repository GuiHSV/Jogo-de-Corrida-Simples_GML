// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information



function moveH_geral(){//objeto){
	with(other)
	{
		var velh = global.velhGeral + other.velh;
		var _velh = sign(velh);
		repeat(abs(velh))
		{
			#region INTERAÇÃO COM RAMPAS
			/*if object_get_name(object_index) == "obj_Solido_movel" //tentar ver se "if object_get_name(id)" funciona
			{
				//CÁDIGOS VINDOS DO PLAYER, NÃO ADAPTADOS PRO OBJ_SOLIDO_MOVEL
				//faz player subir rampa
				if place_meeting(x+_velh, y, obj_Solido) and !place_meeting(x+_velh, y-1, obj_Solido)
				{
					y--;
				}
				//faz player descer rampa
				if !place_meeting(x+_velh, y, obj_Solido) and !place_meeting(x+_velh, y+1, obj_Solido) and !place_meeting(x+_velh, y+2, obj_Solido)
				{
					y++;
				}
			}//*/
			#endregion
			
			x += _velh;
			if(place_meeting(x,y, obj_Player)) obj_Player.estado = "morto";
		}
	}
	
	//melhorar código para acumular valores não inteiros para serem usado
}

/*function alinhamento_vertical(){
	alinha os objetos verticalmnete quando necessário
}//*/

//function gravidade(){} será usado por: player, bola de feno, outroPassaro e outras coisas

