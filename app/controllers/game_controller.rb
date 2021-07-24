# frozen_string_literal: true

class GameController < BaseController
  include GameLogic
  include Codebreaker::Validation
  include Statistics

  attr_accessor :path, :view_path, :app, :errors

  def initialize(path, view_path)
    super
    @path = path
    @view_path = view_path
    @app = nil
    @errors = []
  end

  def check_post
    check_input
    check_game_status
  end

  def check_game_status
    return game_won if game.won?
    return game_lose if game.lose?

    render_page
  end

  def game_lose
    redirect(Constants::LOSE_URL)
  end

  def game_won
    save_date(game.to_h)
    @app.session.clear
    redirect(Constants::WIN_URL)
  end

  def check_input
    if @app.params.key?('number')
      check_code(@app.params['number'])
      user_code(@app.params['number']) if @errors.empty?
    elsif @app.params.key?('hint')
      use_hints
    end
  end

  def check_code(code)
    code_length(code)
    code_is_valid?(code)
  rescue StandardError => e
    @errors.push(e)
  end
end
