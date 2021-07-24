# frozen_string_literal: true

class GameLose < BaseMiddleware
  def checks
    return call_next if @game.nil? || @game.won?
    return redirect(Constants::LOSE_URL) if @game.lose? && (@path == Constants::WIN_URL || @path == Constants::GAME_URL)

    call_next
  end
end
