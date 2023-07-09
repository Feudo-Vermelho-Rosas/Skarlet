/// @description Colisão com a hitbox de ataque.

// Quebre o vaso quando o personagem atacar ele.
audio_play_sound(snd_vaso_quebrando,100,false);
instance_destroy();
