# frozen_string_literal: true

class RedirectActiveGame < BaseMiddleware
  def checks
    return call_next if !@game || @game.lose? || @game.won? || @path == Constants::GAME_URL

    redirect(Constants::GAME_URL)
  end
end
