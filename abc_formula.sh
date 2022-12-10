#!/bin/bash

D=$(/bin/calc -q -- "($2)^2 - 4*($1)*($3)")
echo "discriminant = $D"

if [[ $D -lt 0 ]]; then
	echo "Discriminant lesser than 0, no solutions for x"
else
	echo " first x = $(/bin/calc -q -- "(-($2) - sqrt($D))/(2*($1))")"
	echo "second x = $(/bin/calc -q -- "(-($2) + sqrt($D))/(2*($1))")"
fi

