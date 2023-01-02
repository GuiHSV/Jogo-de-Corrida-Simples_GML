// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

#macro GRAVIDADE .1
#macro VELH_INICIAL 2






/*function alinhamento_vertical(){
	alinha os objetos verticalmnete quando necessário
}//*/

function gravidade(){ //será usado por: player, bola de feno, outroPassaro e outras coisas
	with(other) //incompleto?
	{
		if(!chao) velv += massa * GRAVIDADE;
	}
}

