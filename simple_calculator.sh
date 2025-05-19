#!/bin/bash
#Accept two numbers and an operator from the user and calculate the result

#checks if the number of arguments is equals to 3
if [ $# -eq 3 ]; then
    first_number=$1
    second_number=$2
    operator=$3
    
    #Valid operators
    valid_operators=("+" "-" "*" "/" "%" "^")
    is_valid=false

    for op in "${valid_operators[@]}"; do
        if [ "$operator" == "$op" ]; then
            is_valid=true
            break
        fi
    done

    if [ "$is_valid" = true ]; then
        result=$(echo "$first_number $operator $second_number" | bc -l)
        echo "Result: $result"
    else
        echo "$operator is not a valid operator"
        echo "Valid operators: + - * / % **"
        exit 1
    fi

else
    echo "This script needs 3 arguments"
    echo "Usage: ./simple_calculator.sh <first_number> <second_number> <operator>"
    echo "Example: ./simple_calculator.sh 10 5 +"
    echo "If you're using * or ** please try ./simple_calculator.sh 10 2 '*' "
    exit 1
fi