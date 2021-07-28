# frozen_string_literal: true

class BaseMiddleware
  def initialize(app)
    @app = app
  end

  PAGE_GAME = [Constants::LOSE_URL, Constants::WIN_URL, Constants::GAME_URL].freeze

  def init_request_params(env)
    @env = env
    @request = Rack::Request.new(@env)
    @game = @request.session[:game]
    @path = @request.path
  end

  def call(env)
    init_request_params(env)
    checks
  end

  def call_next
    @app.call(@env)
  end

  def redirect(path)
    [301, { 'Location' => path }, ['']]
  end

  def game_route?
    [Constants::LOSE_URL, Constants::WIN_URL, Constants::GAME_URL].include?(@path)
  end
end
