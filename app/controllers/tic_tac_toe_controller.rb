class TicTacToeController < ApplicationController
  before_action :initialize_game, only: [:index, :reset]

  def index
    # initialize_game if session[:game].nil? 
    puts "#{session[:game].inspect}"
    puts "#{session[:game][:current_player]}"
  end

  

  def end_turn
    puts params[:move].to_i
    move = params[:move].to_i
    puts 'ini session'
    puts "#{session[:game]['current_player']}"

    if valid_move?(move)
      make_move(move)
      check_winner
      switch_player
    end


    redirect_to action: :new_game
  end

  def new_game
  end
  
  def reset
    session[:game] = nil
    redirect_to action: :index
  end

  def undo_turn
    if session[:game]['current_player'] != 1
      session[:game]['board'][session[:game]['player1']['last_move']] = nil
      session[:game]['player1']['last_move'] = nil
    else
      session[:game]['board'][session[:game]['player2']['last_move']] = nil
      session[:game]['player2']['last_move'] = nil
    end
    switch_player
    redirect_to action: :new_game
  end

  def update_names
    session[:game]['player1']['name'] = params[:new_player1_name]
    session[:game]['player2']['name'] = params[:new_player2_name]
  
    redirect_to action: :new_game
  end

  private

  def initialize_game
    session[:game] = {
      board: Array.new(9),
      current_player: 1,
      player1: { name: 'Player 1', symbol: 'X', last_move: nil },
      player2: { name: 'Player 2', symbol: 'O', last_move: nil }
    }
  end

  def valid_move?(move)
    return false if move < 0 || move >= 9
    return false unless session[:game]['board'][move].nil?

    true
  end

  def make_move(move)
    puts "make move : #{move}"
    puts "session : #{session[:game]}"
    puts "player #{current_player_symbol(move)}"
    puts "board move #{session[:game]['board']}" 
    session[:game]['board'][move] = current_player_symbol(move)
    puts session[:game]['board'][move]
  end

  def switch_player
    session[:game]['current_player'] = 3 - session[:game]['current_player']
  end

  def current_player_symbol(move)
    puts "curent player session : #{session[:game]['current_player'] == 1}"
    # session[:game]['current_player'] == 1 ? 'X' : 'O'
    if session[:game]['current_player'] == 1
      session[:game]['player1']['last_move'] = move
      return 'X'
    else
      session[:game]['player2']['last_move'] = move
      return 'O'
    end
  end

  def check_winner
    board = session[:game]['board']
    winning_combinations = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8], 
      [0, 3, 6], [1, 4, 7], [2, 5, 8], 
      [0, 4, 8], [2, 4, 6]
    ]

    winning_combinations.each do |combo|
      positions = combo.map { |position| board[position] }

      if positions.uniq.length == 1 && !positions[0].nil?
        announce_winner(positions[0])
        return
      end
    end

    check_tie
  end

  def announce_winner(symbol)
    if symbol == 'X'
      winner_name = session[:game]['player1']['name']
    else
      winner_name = session[:game]['player2']['name']
    end
    
    # winner_name = symbol == 'X' ? session[:game]['player1']['name'] : session[:game]['player2']['name']
    puts "#{winner_name} (#{symbol}) wins!"
    flash[:notice] = "#{winner_name} (#{symbol}) wins!"
  end
  
  def check_tie
    if session[:game]['board'].all? { |cell| !cell.nil? }
      flash[:notice] = "Draw"
    end
  end
end
