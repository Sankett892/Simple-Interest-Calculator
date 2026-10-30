#!/usr/bin/env bash

# Simple Interest Calculator
# Formula: Simple Interest = (Principal * Rate * Time) / 100

echo "================================="
echo "      SIMPLE INTEREST CALCULATOR"
echo "================================="

read -p "Enter principal amount: " principal
read -p "Enter annual rate of interest (%): " rate
read -p "Enter time period (years): " time

# Validate that inputs are numeric and non-negative
if ! [[ "$principal" =~ ^[0-9]+([.][0-9]+)?$ ]] ||
   ! [[ "$rate" =~ ^[0-9]+([.][0-9]+)?$ ]] ||
   ! [[ "$time" =~ ^[0-9]+([.][0-9]+)?$ ]]; then
    echo "Error: Please enter valid non-negative numbers."
    exit 1
fi

# Calculate using awk for decimal arithmetic
simple_interest=$(awk -v p="$principal" -v r="$rate" -v t="$time"     'BEGIN { printf "%.2f", (p * r * t) / 100 }')

total_amount=$(awk -v p="$principal" -v si="$simple_interest"     'BEGIN { printf "%.2f", p + si }')

echo
echo "----------- RESULT -----------"
echo "Principal Amount : $principal"
echo "Rate of Interest : $rate%"
echo "Time Period      : $time years"
echo "Simple Interest  : $simple_interest"
echo "Total Amount     : $total_amount"
echo "------------------------------"
