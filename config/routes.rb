Rails.application.routes.draw do
  root 'tic_tac_toe#index'
  get 'tic_tac_toe/new_game'
  get 'tic_tac_toe/index'
  post 'tic_tac_toe/end_turn'
  post 'tic_tac_toe/reset'
  post 'tic_tac_toe/undo_turn'
  post 'tic_tac_toe/update_names'
end
