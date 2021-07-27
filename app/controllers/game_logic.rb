# frozen_string_literal: true

module GameLogic
  include Codebreaker

  def game
    @app.session['game']
  end

  def user_name
    game.user
  end

  def secret_code
    game.secret_code.join
  end

  def game_difficulty
    game.difficulty
  end

  def total_attempts
    DIFFICULTY[game.difficulty][:attempts]
  end

  def total_hints
    DIFFICULTY[game.difficulty][:hints]
  end

  def game_attempts
    game.instance_variable_get(:@attempts)
  end

  def game_hints
    game.instance_variable_get(:@hints)
  end

  def use_hints
    @hint = game.use_hint
    @app.session['hints'] << @hint unless @hint == false
  end

  def check_hint
    game.use_hint
  end

  def user_code(code)
    @input_code = game.input_code(code)
  end

  def code_result
    return [] if @input_code.nil?

    @input_code.chars.concat(Array.new(4 - @input_code.length))
  end
end
