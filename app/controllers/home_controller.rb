# frozen_string_literal: true

class HomeController < BaseController
  include Codebreaker::Validation
  attr_reader :name, :difficulty

  def give_difficulty
    Codebreaker::DIFFICULTY.map(&:first)
  end

  def check_post
    validate_params
    @app.session[:game] = Codebreaker::Game.new(name, difficulty) if @errors.empty?
    @app.session['hints'] = []
    @errors.empty? ? redirect(Constants::GAME_URL) : redirect(Constants::HOME_URL)
  end

  def validate_params
    @name = @app.params['player_name']
    @difficulty = @app.params['level']
    check_name(@name)
    checks_difficulty(@difficulty)
  end

  def check_name(name)
    check_user(name)
  rescue StandardError => e
    @errors.push(e)
  end

  def checks_difficulty(difficulty)
    check_difficulty(difficulty)
  rescue StandardError => e
    @errors.push(e)
  end
end
