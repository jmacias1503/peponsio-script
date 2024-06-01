for i in {1..150}; do
	AGE=$(shuf -i 20-40 -n 1)
	HEARTRATE=$(shuf -i 60-100 -n 1)
	BREATHRATE=$(shuf -i 12-20 -n 1)
	TENSIONSISTOLICA=$(shuf -i 120-139 -n 1)
	TEENSIONDIASTOLICA=$(shuf -i 80-89 -n 1)
	NAMENUMBER=$(shuf -i 1-100 -n 1)
	HEIGHTCENTIMETERS=$(shuf -i 165-185 -n 1)
	if (("$HEIGHTCENTIMETERS" >= 165 && "$HEIGHTCENTIMETERS" <= 180)); then
		WEIGHTNUMBER=$(shuf -i 1-11 -n 1)
	else
		WEIGHTNUMBER=$(shuf -i 11-26 -n 1)
	fi
	WEIGHT=$(sed -n "$WEIGHTNUMBER"p weight-list.txt)
	NAME=$(sed -n "$NAMENUMBER"p name-list.txt)
	FIRSTAPELLIDONUM=$(shuf -i 1-100 -n 1)
	SECONDAPELLIDONUM=$(shuf -i 1-100 -n 1)
	FIRSTAPELLIDO=$(sed -n "$FIRSTAPELLIDONUM"p apellidos-list.txt)
	SECONDAPELLIDO=$(sed -n "$SECONDAPELLIDONUM"p apellidos-list.txt)
	if (("$NAMENUMBER" >= 1 && "$NAMENUMBER" <= 59)); then
		ASAB="Masculino"
	else
		ASAB="Femenino"
	fi
	if(("$AGE" >= 20 && "$AGE" <= 28));then
		UNDERGRADNUM=$(shuf -i 0-1 -n 1)
	else
		UNDERGRADNUM=0
	fi
	[ "$UNDERGRADNUM" == 1 ] && UNDERGRAD="Si"
	[ "$UNDERGRADNUM" == 0 ] && UNDERGRAD="No"
	[ "$UNDERGRAD" == "Si" ] && CAREERNUMBER=$(shuf -i 1-17 -n 1) && CAREER=$(sed -n "$CAREERNUMBER"p career-list.txt)
	[ "$UNDERGRAD" == "No" ] && CAREERNUMBER=$(shuf -i 1-56 -n 1) && CAREER=$(sed -n "$CAREERNUMBER"p job-list.txt)
	EXERCISEHOEURS=$(shuf -i 2-12 -n 1)
	[ "$CAREER" == "Medicina" ] || [ "$CAREER" == "Enfermería" ] || [ "$CAREER" == "Médico" ] || [ "$CAREER" == "Profesional en ciencias del deporte" ] && EXERCISEHOEURS=$(shuf -i 7-14 -n 1)

	echo "\\def\\age{$AGE}
	\\def\\asab{$ASAB}
	\\def\\weight{$WEIGHT kg}
	\\def\\talla{$HEIGHTCENTIMETERS cm}
	\\def\\undergrad{$UNDERGRAD}
	\\def\\career{$CAREER}
	\\def\\horasejercicio{$EXERCISEHOEURS horas}
	\\def\\heartrate{$HEARTRATE}
	\\def\\breathrate{$BREATHRATE}
	\\def\\presion{$TENSIONSISTOLICA/$TEENSIONDIASTOLICA mmHg}
	\\def\\name{$NAME $FIRSTAPELLIDO $SECONDAPELLIDO}" > "$i".info
done
