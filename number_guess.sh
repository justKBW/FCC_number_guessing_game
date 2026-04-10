#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
RAN_NUMBER=$(($RANDOM%1000+1))

MAIN (){
	# welcoming block
  # get user name   
  echo -e "\nEnter your username:" 
	read USERNAME

  # check if user exist
  # get user_id from database
  USERNAME_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME'")
  if [[ -z $USERNAME_ID ]]
    then 
      # add new user to database
      NEW_PLAYER=$($PSQL "INSERT INTO users (username) VALUES('$USERNAME')")
            echo "Welcome, $USERNAME! It looks like this is your first time here."
    else
      USERDATA=$($PSQL "SELECT played_game, best_game FROM users WHERE user_id = '$USERNAME_ID'")
      echo $USERDATA | while IFS="|" read PLAYED_GAMES BEST_GAME
		do
      echo -e "\nWelcome back, $USERNAME! You have played $PLAYED_GAMES games, and your best game took $BEST_GAME guesses."
    done    
  fi

  # guessing block
  # get player's guess
  echo "Guess the secret number between 1 and 1000:"
  read PLAYER_NUMBER
  # declaring starting values of guesses
  AMOUNT_GUESSES=1
  echo $RAN_NUMBER
  # conditional block
while [[ $PLAYER_NUMBER -ne $RAN_NUMBER ]]
	do
		# check for correct input format    
    if [[ ! $PLAYER_NUMBER =~ ^[0-9]+$ ]]
		then 
			echo -e "\nThat is not an integer, guess again: " 
			read PLAYER_NUMBER
		elif [[ $PLAYER_NUMBER > $RAN_NUMBER ]]
		then
			echo -e "\nIt's lower than that, guess again: " 
			read PLAYER_NUMBER
		elif [[ $PLAYER_NUMBER < $RAN_NUMBER ]]
		then 
			echo -e "\nIt's higher than that, guess again: " 
			read PLAYER_NUMBER
		fi

		AMOUNT_GUESSES=$(( $AMOUNT_GUESSES + 1 ))
	done

echo -e "\nYou guessed it in $AMOUNT_GUESSES tries. The secret number was $RAN_NUMBER. Nice job!"

# updating played_games & best_game in db
# getting saved data
USERDATA=$($PSQL "SELECT user_id, played_game, best_game FROM users WHERE username = '$USERNAME'")
echo $USERDATA | while IFS="|" read USER_ID PLAYED_GAMES BEST_GAME
		do
      # updating amount of played games
      NEW_PLAYED_GAMES=$(( $GAMES_PLAYED + 1 ))
      # updating database
      UPDATE_NEW_GAMES_PLAYED=$($PSQL "UPDATE users SET played_game = $NEW_PLAYED_GAMES WHERE user_id = $USER_ID")
      # checking if game was better than the saved best_game
      if [[ $AMOUNT_GUESSES < $READ_BEST_GAME || $BEST_GAME == 0 ]]
	      then
		      UPDATE_BEST_GAME=$($PSQL "UPDATE users SET best_game = $AMOUNT_GUESSES WHERE user_id = $USER_ID")
	    fi
    done    
}

MAIN
