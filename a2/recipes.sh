#!/bin/bash

#function to find recipes with certain ingredients

#csv file with recipes
foodList="/home/sherine_aldrin/food_ingredients.csv"

find_recipes () {
	echo -n "Please enter one ingredient you would like in your recipe:"
        read input

	echo "Searching for recipes with '$input'..."
	ingredient=$(echo "$input" | tr '[:upper:]' '[:lower:]')

	awk -v ingredient="$ingredient" -F ',' '
	{
		#trim excess spacing
		gsub(/^ *| *$/, "", $2)
		gsub(/^ *| *$/, "", $3)
		gsub(/^ *| *$/, "", $4)
		gsub(/^ *| *$/, "", $5)

		#checking if the ingredient is listed anywhere in the recipe
		if (tolower($2) ~ ingredient || tolower($3) ~ ingredient || tolower($4) ~ ingredient || tolower($5) ~ ingredient)
	        { print "Recipe found: " $1
		}
        }' "$foodList"

		
}
find_recipes #to run the function
