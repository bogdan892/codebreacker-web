# frozen_string_literal: true

require_relative 'dependencies'
use Rack::Reloader, 0
use Rack::Static, urls: ['/assets'], root: 'app/public'
use Rack::Session::Cookie, key: 'rack.session',
                           path: Constants::HOME_URL,
                           expire_after: 2_592_000,
                           secret: 'change_me',
                           old_secret: 'also_change_me'

use GameWon
use GameLose
use GameCheckActive

run Router
