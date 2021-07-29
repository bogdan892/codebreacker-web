# frozen_string_literal: true

require 'i18n'
require 'pry'
require 'yaml'
require 'codebreaker'
require_relative 'app/constants'
require_relative 'app/controllers/statistics'
require_relative 'app/controllers/game_logic'
require_relative 'app/controllers/base_conroller'
require_relative 'app/controllers/home_controller'
require_relative 'app/controllers/game_controller'
require_relative 'app/controllers/lose_controller'
require_relative 'app/controllers/rules_controller'
require_relative 'app/controllers/statistics_controller'
require_relative 'app/controllers/win_controller'
require_relative 'app/middlewares/base_middleware'
require_relative 'app/middlewares/redirect_home_middleware'
require_relative 'app/middlewares/check_game_status_middleware'
require_relative 'app/middlewares/redirect_active_game_middleware'
require_relative 'router'
I18n.load_path << Dir["#{File.expand_path('app/config/locales')}/*.yml"]
I18n.config.available_locales = :en
