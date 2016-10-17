source ./kv-bash

if [ ! -z $1 ]; then
	kvset NAME $1
fi

if [ ! -z $2 ]; then
	kvset TOOL $2
fi

echo $(kvlist)

NAME=$(kvget NAME)
TOOL=$(kvget TOOL)

# echo $NAME
# echo $TOOL

mcrl22lps "$NAME.mcrl2" "$NAME.lps" -lstack

if [ $? -eq 0 ]; then
	lps2lts "$NAME.lps" "$NAME.lts"

	if [ $? -eq 0 ]; then
		$TOOL "$NAME.lts"
	else
		echo lps2lts failed
	fi
else
    echo mcrl22lps failed
fi
