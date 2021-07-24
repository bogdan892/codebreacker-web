# frozen_string_literal: true

class GameWon < BaseMiddleware
  def checks
    return call_next if @game.nil? || @game.lose?
    return redirect(Constants::WIN_URL) if @game.won? && (@path == Constants::LOSE_URL || @path == Constants::GAME_URL)

    call_next
  end
end
