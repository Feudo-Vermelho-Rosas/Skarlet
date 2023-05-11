/// @description

// Tome hit se não estiver invulnerável.
if !invulneravel {
	
	// Mude as stats.
	hp -= other.dano;
	kb_speed = other.kb;
	invulneravel = true;
	veloc_dir = point_direction(x,y,other.x,other.y)-180;
	
	// Set os alarmes.
	hit_alarme = hit_duracao;
	invulneravel_alarme = invulneravel_duracao;
	
	// Destrua o projétil.
	instance_destroy(other);
	
}