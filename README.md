
# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:
* release version: v.0.1_beta

* rails version: 5.1.7

* ruby version: 2.7.6p219 

* license: public

* basic project: tic tac toe game

* feature 
1. Display the tic-tac-toe board
2. Allow users to enter their name.
3. Then prompts for Player 1 name (symbol 'X')
4. Same for Player 2 name (symbol 'O')
5. automatic turn end on click.
6. Each move has to be evaluated for invalid and illegal moves.
7. Update the board state constantly with users input states.
8. Have a reset button to clear the game state & users info.
9. The game continues until it's over, when the game is over, it announces the result (draw or win).
10. ui and server tracing inspect for beta test
11. advance limited undo

*note
-because rails and ruby version not supported. can't use several syntax like session[:game]['current_player'] == 1 ? 'X' : 'O', session[:game][:player2][:name:] 
-use branch development
