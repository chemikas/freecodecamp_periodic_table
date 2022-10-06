#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

if [[ -z $1 ]]
  then
      echo "Please provide an element as an argument."
  else 
    # check if argument is a number
    if [[ ! $1 =~ ^[0-9]+$ ]]
    then 
      echo "It's not a number"
    else 
      echo "It's a number!"
    fi
    #check if argument is one or two leters

    #check if arguent is in list of elements name
    
  fi
