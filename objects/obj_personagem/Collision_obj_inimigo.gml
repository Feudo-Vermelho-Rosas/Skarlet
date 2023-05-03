/// @description

// Tome hit se não estiver invulnerável.
if !invulneravel {
	
	// Mude as stats.
	hp -= other.dano;
	kb_speed = other.kb;
	invulneravel = true;
	veloc_dir = other.veloc_dir;
	
	// Set os alarmes.
	hit_alarme = hit_duracao;
	invulneravel_alarme = invulneravel_duracao;
	
}
