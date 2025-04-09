
BEGIN { FS = "," } #field separator is a comma
#Stores the sum of grades for each student in an associative array.
{
	if (NR > 1){
		totals[$2] = ($3 + $4 + $5)

	}
}



#Calculates the average grade for each student and classifies them as Pass (average ≥ 70) or Fail

function averageGrade(first, second, third)#takes 3 grades as input and computes the average
{
	average = ((first + second + third) / 3)
	return average
}


#classifies them as Pass (average ≥ 70) or Fail
{
	if (NR > 1){
		if (averageGrade($3, $4, $5) <= 70)
			status[$2] = "Fail"
		else
			status[$2] = "Pass"
	}
}


#print all the information
{
	if (NR > 1){
		print $2, "Total score: ", totals[$2], "Average: ", averageGrade($3, $4, $5), "Status: ", status[$2]
	}
}

#Determine the highest and lowest scoring students
	
END{
	min = 100
	max = 0

	for (student in totals)
	{
		if (totals[student] < min){
			min = totals[student]
			minStudent = student
		}
		if (totals[student] > max){
        	        max = totals[student]
			maxStudent = student
		}

	}
	print "Top scoring: ", maxStudent, ": ",  max, " Lowest scoring: ", minStudent, ": ", min
}

