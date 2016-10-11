mcrl22lps "test.mcrl2" "test.lps" -lstack

if [ $? -eq 0 ]; then
	lps2lts "test.lps" "test.lts"

	if [ $? -eq 0 ]; then
		ltsview "test.lts"
	else
		echo lps2lts failed
	fi
else
    echo mcrl22lps failed
fi

