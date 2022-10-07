#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

GET_PROPS () {
  TYPE_ID+$($PSQL "select type_id from properties where atomic_number=$ATOMIC_NUMBER;")
  TYPE=$($PSQL "select type from types where type_id=$TYPE_ID;")
  AW=$($PSQL "select atomic_mass from properties where atomic_number=$ATOMIC_NUMBER;")
  MP=$($PSQL "select melting_point_celsius from properties where atomic_number=$ATOMIC_NUMBER;")
  BP=$($PSQL "select boiling_point_celsius from properties where atomic_number=$ATOMIC_NUMBER;")
}

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
      

    #check if argument is one or two leters

    #check if arguent is in list of elements name

    fi
  
    GET_PROPS
    echo "The element with atomic number $ATOMIC_NUMBER is$NAME (${SYMBOL}). It's a$TYPE, with a mass of ${AW} amu. 
Hydrogen has a melting point of ${MP} celsius and a boiling point of ${BP} celsius."

  fi

