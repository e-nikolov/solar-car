source ./kv-bash

if [ ! -z $1 ]; then
	kvset NAME $1
fi

if [ ! -z $2 ]; then
	kvset FORMULA $2
fi

echo $(kvlist)

NAME=$(kvget NAME)
FORMULA=$(kvget FORMULA)

# echo $NAME
# echo $TOOL

# mcrl22lps "$NAME.mcrl2" "$NAME.lps" -lstack

if [ $? -eq 0 ]; then
	echo ------------------
	echo Running lts2pbes..
	echo ------------------

	lts2pbes --formula="modal_formulas/$FORMULA.mcf" "$NAME.lts"  "$NAME.pbes" --verbose

	if [ $? -eq 0 ]; then
		echo -------------------
		echo Running pbes2bool..
		echo -------------------
	
		pbes2bool "$NAME.pbes" --verbose
	else
		echo lts2pbes failed
	fi
else
    echo mcrl22lps failed
fi
