#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

GET_PROPS () {
  TYPE_ID=$($PSQL "select type_id from properties where atomic_number=$ATOMIC_NUMBER;")
  TYPE=$($PSQL "select type from types where type_id=$TYPE_ID;")
  TYPE="$(echo -e "${TYPE}" | sed -e 's/^[[:space:]]*//')"
  AW=$($PSQL "select atomic_mass from properties where atomic_number=$ATOMIC_NUMBER;")
  AW="$(echo -e "$AW" | sed -e 's/^[[:space:]]*//')"
  MP=$($PSQL "select melting_point_celsius from properties where atomic_number=$ATOMIC_NUMBER;")
  MP="$(echo -e "$MP" | sed -e 's/^[[:space:]]*//')"
  BP=$($PSQL "select boiling_point_celsius from properties where atomic_number=$ATOMIC_NUMBER;")
  BP="$(echo -e "$BP" | sed -e 's/^[[:space:]]*//')"
}

if [[ -z $1 ]]
  then
      echo "Please provide an element as an argument."
  else 
    # check if argument is a number
    if [[ $1 =~ ^[0-9]+$ ]]
    then 
         
      NAME="$(echo -e "$($PSQL "SELECT name from elements where atomic_number = $1;")" | sed -e 's/^[[:space:]]*//')"
      SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number = $1;") 
      SYMBOL="$(echo -e "$SYMBOL" | sed -e 's/^[[:space:]]*//')"
      ATOMIC_NUMBER=$1

    else
     #check if argument is one or two leters
    
      if [[ $1 =~ ^[A-Za-z]{2}$|^[A-Za-z]$ ]]
      then
        echo "It's two letters"
        
      else 
        #check if arguent is in list of elements name
        echo "NOT A CHANCE ! ! ! ! ! ! ! ! "
      fi
  fi    
  
    #GET_PROPS
    #echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $AW amu. $NAME has a melting point of ${MP} celsius and a boiling point of ${BP} celsius."

  fi

