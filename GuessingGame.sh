#!/bin/bash

random_number=$(( $RANDOM % 52 ));
# this just takes the values min/max subtracts them and adds one so its a true ramdom number


attempts=1
# number of starting attempts

# had to make attempts for starting and max 1 and 4 because the first input counts as 0 

max_attempts=4
#number of max attempts

# while attempts is less than max attepmts ask to pick a number
while (( attempts < max_attempts )) do
    read -p "Enter a number between 0 and 51: " var1

    echo "your attempts are" $attempts
    # makes attempts go up after one run
    ((attempts++))

    # echo $random_number
    # this just gives you the answer at the start for peace of mind sake
    # you can un-comment it to see what your guess is 

    if (( $random_number < $var1 )) then
        echo "number too high"
    fi
    if (( $random_number > $var1 )) then
        echo "number too low"
    fi
    if (($random_number == $var1 )) then
        echo "you guessed the number congrats :)"
        break
    fi
done
read -p "Try again? Y/N or y/n: " var2

#using the pipe down below to say there is another thing it can do
#in this case its the lowercase y and n

# got stuck on this for a bit forgot i wasnt doing numbers anymore and still was using (( )) instead of [[ ]] 
while true; do
    if [[ $var2 == "Y" || $var2 == "y" ]] then
        exec "$0"
    elif [[ $var2 == "N" || $var2 == "n" ]] then
        echo "Thanks for playing :)"
        exit 0
        # exit 0 just exists the program after N or n is typed in to the var2 spot
    fi
done
