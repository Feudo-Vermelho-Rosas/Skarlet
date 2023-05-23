if x >= 0 {
	veloc = -veloc_inicial;
} else if x <= -4080 {
	veloc = veloc_inicial;
}

x += veloc;
