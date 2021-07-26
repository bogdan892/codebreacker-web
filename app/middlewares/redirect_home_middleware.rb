# frozen_string_literal: true

class RedirectHome < BaseMiddleware
  def checks
    return call_next if !game_route? || @game

    redirect(Constants::HOME_URL)
  end
end
