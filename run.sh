mcrl22lps "solar-car.mcrl2" "solar-car.lps" -lstack

if [ $? -eq 0 ]; then
	lps2lts "solar-car.lps" "solar-car.lts"

	if [ $? -eq 0 ]; then
		ltsview "solar-car.lts"
	else
		echo lps2lts failed
	fi
else
    echo mcrl22lps failed
fi

