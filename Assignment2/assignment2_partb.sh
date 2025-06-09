#!/bin/bash

# initalize array to hold grades
gradeInput=()

# prompt and read grades, allowing for multiple entries
echo "Enter no less than 6 numerical grades (0-100):"
read -a grades

# while loop to ensure at least 6 grades are entered
while [ "${#grades[@]}" -lt 6 ]; do
  echo "${#grades[@]} grades entered. Please enter at least 6 grades or type 'D' to finish:"
  read -a gradeInput

  # to allow for an early exit, check if the first input is 'D'
  if [ "${gradeInput[0]}" == "D" ]; then
    break
  fi

  # for each input, since we allow multiple grades in one read, add each grade to the grades array
  for grade in "${gradeInput[@]}"; do
    grades+=("$grade")
  done

done

# summarize grades and perform calculations

printf "%s\n"

# print all grades out
echo "Grades entered: "
for grade in "${grades[@]}"; do
  printf "$grade "
done
printf "%s\n"

total=0

# get total sum of all grades
for grade in ${grades[@]}; do
  total=$(expr $total + $grade)
done

numGrades=${#grades[@]}

avg=$(expr $total / $numGrades)
echo "Average grade(rounded): $avg"

# temp file to hold sorted grades
for grade in "${grades[@]}"; do
  echo "$grade"
done >temp_grades.txt

min=$(cat temp_grades.txt | sort -n | head -n 1)
echo "Minimum grade: $min"
max=$(cat temp_grades.txt | sort -n | tail -n 1)
echo "Maximum grade: $max"
