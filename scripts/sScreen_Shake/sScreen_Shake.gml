function sScreen_Shake(forca, tempo){
	with(obj_cam){
		shake_forca = forca
		shake_tempo = tempo
		alarm[0]    = shake_tempo
	}
}