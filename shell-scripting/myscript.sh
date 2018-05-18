#! /usr/bin/bash

# ECHO COMMAND
echo Hello world!

# VARIABLES
# (Uppercase convention)
NAME="Andy"
echo "My name is $NAME"

 #USER INPUT
read -p "Enter your name: " U_NAME
echo "Hello $U_NAME, nice to meet you"

# CONDITIONALS
NAME="Brad"
if [ "$NAME" == "Brad" ]
then 
    echo "your name is Brad"
fi

read -p "enter your name: " NAME
if [ "$NAME" == "Brad" ]
then
    echo "Your name is Brad"
else
    echo "Your name is not Brad"
fi

# ELSE-IF (ELSEIF)
read -p "enter your name: " NAME
if [ "$NAME" == "Brad" ]
then
    echo "Your name is Brad"
elif [ "$NAME" == "jack" ]
then
    echo "Your name is jack"
else
    echo "Your name is not Brad nor jack"
fi

# COMPARISON
NUM1=31
NUM2=5
if [ "$NUM1" -gt "$NUM2" ]
then 
    echo "$NUM1 is greater than $NUM2"
else
    echo "$NUM1 is less than $NUM2"
fi

#FILE CONDITIONS
FILE="test.txt"
if [ -e "$FILE" ]
then 
    echo "$FILE exists"
else
    echo "$FILE does not exist"
fi


#CASE STATEMENTS
read -p "Are you 21 or over? Y/N " ANSWER
case "$ANSWER" in
    [yY] | [yY][eE][sS])
        echo "You can have a beer :)"
        ;;
    [nN] | [nN][oO])
        echo "Sorry, no drinking :("
        ;;
    *)
        echo "Please enter y/yes or n/no"
        ;;
esac

# SIMPLE FOR LOOP
NAMES="Brad Kevin Alice Mark"
for NAME in $NAMES
    do 
        echo "Hello $NAME"
done

# FOR LOOP TO RENAME FILES
FILES=$(ls *.txt)
NEW="new"

for FILE in $FILES
    do 
        echo "Renaming $FILE to new-$FILE"
        mv $FILE wow-$FILE
done

#WHILE LOOP
# Read through the file line by line
LINE=1
while read -r CURRENT_LINE
    do
        echo "$LINE: $CURRENT_LINE"
        ((LINE++))
done < "./wow-new-2.txt"

#FUNTION

function sayHello() {
    echo "Hello World"
}

sayHello

#FUNCTION WITH PARAMS
function greet() {
    echo "Hello, I am $1 and I am $2"
}
greet "Brad" "27"

# CREATE FOLDER AND WRITE TO A FILE
mkdir hello
touch "hello/world.txt"
echo "Hello world" >> "hello/world.txt"
echo "Created hello/world.txt"
