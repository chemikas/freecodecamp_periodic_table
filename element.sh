#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"



if [[ -z $1 ]]
  then
      echo "Please provide an element as an argument."
  else 
    # check if argument is a number
    if [[ $1 =~ ^[0-9]+$ ]]
    then 
         
      NAME=$($PSQL "SELECT name from elements where atomic_number = $1;")
      SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number = $1;")
      ATOMIC_NUMBER=$1
      echo "The element with atomic number $ATOMIC_NUMBER is$NAME (${SYMBOL})."
      GET_PROPS
    fi

    #check if argument is one or two leters

    #check if arguent is in list of elements name
    
  fi

#get element data
echo " DON'T WORRY, BE HAPPY ! ! ! ! "
:'
_elements
atomic_number
name
symbol
_types
type
_properties
atomic_weight
melting_point_celsius
boiling_point_celsius
'

#print report
echo -e "The element with atomic number 1 is Hydrogen (H). It's a nonmetal, with a mass of 1.008 amu. 
Hydrogen has a melting point of -259.1 celsius and a boiling point of -252.9 celsius."
