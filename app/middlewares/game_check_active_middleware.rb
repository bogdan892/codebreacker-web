# frozen_string_literal: true

class GameCheckActive < BaseMiddleware
  def checks
    return redirect(Constants::HOME_URL) if !@game && game_route?
    return call_next unless @game
    return redirect(Constants::GAME_URL) if check_active_game?

    call_next
  end
end
