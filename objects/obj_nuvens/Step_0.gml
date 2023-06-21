if x >= 0 {
	veloc = -veloc_inicial;
} else if x <= -3000 {
	veloc = veloc_inicial;
}

x += veloc;
