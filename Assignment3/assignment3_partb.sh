#!/bin/bash
# Name: Lucas Vandermaarel
# Date: June 18, 2025
# Description: The implementation of two functions. One to convert Celcius temperatures to fahrenheit and one to convert miles to kilometers.

# Celcius to Fahrenheit
function CtoF() {
  read -p "Please enter a temperature in Celcius to convert to Fahrenheit: " C

  F=$((($C * 9 / 5) + 32))
  echo "Fahrenheit: $F"
}

function milesToKm() {
  read -p "Enter the miles you wish to convert to kilometers: " mi
  # scale =2 is used to limit the output to 2 decimal places
  # and divide by 1 so that bc performs the scale functionality.
  km=$(echo "scale=2; $mi * 1.609344 / 1" | bc -l)

  echo "Miles: $mi"
  echo "Converted to Kilometers: $km"
}

# provide menu
function menu() {
  echo "Menu:"
  echo "1. Convert a Celcius temperature to Fahrenheit"
  echo "2. Convert miles to kilometers"
  echo "3. Exit"

  echo "Please select an option (1-3):"
  read -r choice
  case $choice in
  1)
    CtoF
    ;;
  2)
    milesToKm
    ;;
  3)
    exit 0
    ;;
  *) echo "Invalid option. Please try again." ;;
  esac
}

while (true); do
  menu
  echo -e "----------------------------------\n"
done
