#!/bin/bash
# Name: Lucas Vandermaarel
# Date: June 15, 2025
# Description: Provides a menu to select different functions to check even/odd, string comparison, leap year, and string type.

# provide menu
function menu() {
  echo "Menu:"
  echo "1. Check number for even or odd"
  echo "2. Check if String is Equal or not (String: scooby)"
  echo "3. Check if a year is a leap year"
  echo "4. Check if the input is a string, number, or special characters"
  echo "5. Exit"

  switch=$(echo -e "1\n2\n3\n4\n5")
  echo "Please select an option (1-5):"
  read -r choice
  case $choice in
  1)
    EvenOdd
    ;;
  2)
    StringCompare
    ;;
  3)
    LeapYear
    ;;
  4)
    isString
    ;;
  5) exit 0 ;;
  *) echo "Invalid option. Please try again." ;;
  esac
}

# even or odd function
function EvenOdd() {

  echo "Please enter a number to check if it is even or odd:"
  read -r number

  if ((number % 2 == 0)); then
    echo "The number is even."
  else
    echo "The number is odd."
  fi
}

# comparing string function
function StringCompare() {
  echo "Please enter a string to compare with 'scooby':"
  read -r input_string

  if [[ "$input_string" == "scooby" ]]; then
    echo "The string is equal to 'scooby'."
  else
    echo "The string is not equal to 'scooby'."
  fi
}

# leap year function
# a leap year is divisible by 4 OR divisible by 100 AND divisible by 400
function LeapYear() {
  echo "Please enter a year to check if it is a leap year:"
  read -r year

  if (((year % 4 == 0 && year % 100 != 0) || year % 400 == 0)); then
    echo "The year $year is a leap year."
  else
    echo "The year $year is not a leap year."
  fi
}

function isString() {
  echo "Please enter a value to check if it is a string, number or special characters:"
  read -r input

  # using regex to check if the input is a string
  # =~ is regex match operator and the regex ^[a-zA-Z]
  # ^ makes the regex match at the start of the string
  # a-zA-z matches any letter from a to z or A to Z
  # + means one or more occurences of the preceding element
  # $ means the regex must match all the way to the end of the input_value
  if [[ $input =~ ^[a-zA-Z]+$ ]]; then
    echo "The input ($input) is a string."
    # regex to check if the input is a number
    # 0-9 matches any digit from 0 to 9 and like the previous regex
    # it matches all the way from the start to the end
  elif [[ $input =~ ^[0-9]+$ ]]; then
    echo "The input ($input) is a number."
    # regex to check if the input is special characters
    # more concise to check if input is not a string or number
    # the ^ inside of the square brackets negates the match
    # again, matches from the start to the end
  elif [[ $input =~ ^[^a-zA-Z0-9]+$ ]]; then
    echo "The input ($input) is/are special character(s)."
  else
    echo "The input is a combination of characters, numbers, or special characters."
  fi
}

# main loop to keep displaying the menu
while (true); do
  menu
  echo -e "----------------------------------\n"
done
