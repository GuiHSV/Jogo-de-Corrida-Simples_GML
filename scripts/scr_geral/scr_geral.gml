// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information



function moveH_geral(){//objeto){
	with(other)
	{
		var _velh = sign(global.velhGeral);
		repeat(abs(global.velhGeral))
		{
			#region INTERAÇÃO COM RAMPAS
			/*
			if object_get_name(object_index) == "obj_Solido_movel" //tentar ver se "if object_get_name(id)" serve
			{
				//código que faz player subir e descer rampa
				if place_meeting(x+_velh, y, obj_Solido) and !place_meeting(x+_velh, y-1, obj_Solido)
				{
					y--;
				}
	
				if !place_meeting(x+_velh, y, obj_Solido) and !place_meeting(x+_velh, y+1, obj_Solido) and !place_meeting(x+_velh, y+2, obj_Solido)
				{
					//show_message("teste")
					y++;
				}
			}//*/
			#endregion
			
			x += _velh;
			if(place_meeting(x,y, obj_Player)) obj_Player.estado = "morto";
		}
	}
}

/*function moveV_geral(){
	//precisa alinhar todos os objetos móveis quando movelos verticalmente
}//*/



//function gravidade(){}

