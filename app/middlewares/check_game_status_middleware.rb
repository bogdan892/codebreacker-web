# frozen_string_literal: true

class CheckGameStatus < BaseMiddleware
  def checks
    return call_next if !@game || !game_route?
    return redirect(Constants::WIN_URL) if @game.won? && @path != Constants::WIN_URL

    return redirect(Constants::LOSE_URL) if @game.lose? && @path != Constants::LOSE_URL

    call_next
  end
end
