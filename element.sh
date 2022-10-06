echo "Please provide an element as an argument."
MAIN_MENU() {
if [[ $1 ]]
  then
    echo -e "\n$1"
  fi
}

# check if argument is a number
if [[ $BIKE_ID_TO_RENT =~ ^[0-9]+$ ]]

#check if argument is one or two leters

#check if arguent is in list of elements name