#!bin/bash

#this is my bash script
    #command line args & interactive reading

#asks the user for their name and saves it with the "read name"
echo "what is your name?"
read name


#the print_three function to take the inputs and print them
print_three()
{
    echo "The first parm in the function is: " $1
    echo "The second parm in the function is: " $2
    echo "The thrid parm in the function is: " $3
}


#sets the values of the odd and the even to a variable
odd1=$1
odd2=$3
odd3=$5

even1=$2
even2=$4
even3=$6

#the rest of the print functions to finish the program
echo " "
echo "  The odd list is:"

#calls the function with the input values
print_three $odd1 $odd2 $odd3

echo " "
echo "  The even list is:"

#calls the function with the input values
print_three $even1 $even2 $even3

#calls the name variable set from the top of the script
echo "The name entered after the program started was: " $name
