# frozen_string_literal: true

class Router
  include Constants

  def initialize(env)
    @app = Rack::Request.new(env)
  end

  def self.call(env)
    new(env).get_page(env)
  end

  def get_page(_env)
    case @app.path
    when HOME_URL then HomeController.new(HOME_URL, HOME_VIEW).response(@app)
    when GAME_URL then GameController.new(GAME_URL, GAME_VIEW).response(@app)
    when LOSE_URL then LoseController.new(LOSE_URL, LOSE_VIEW).response(@app)
    when RULES_URL then RulesController.new(RULES_URL, RULES_VIEW).response(@app)
    when STATISTICS_URL then StatisticsController.new(STATISTICS_URL, STATISTICS_VIEW).response(@app)
    when WIN_URL then WinController.new(WIN_URL, WIN_VIEW).response(@app)
    else
      redirect(HOME_URL)
    end
  end

  def redirect(path)
    [301, { 'Location' => path }, ['']]
  end

  def check_request
    @app.request_method
  end
end
