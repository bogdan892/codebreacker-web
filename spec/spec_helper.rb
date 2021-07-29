# frozen_string_literal: true

require 'simplecov'
require 'rack/test'
SimpleCov.start do
  minimum_coverage 90
  add_filter '/spec/'
end

require_relative '../dependencies'
require_relative '../router'

RSpec.configure do |config|
  config.include Rack::Test::Methods

  config.example_status_persistence_file_path = '.rspec_status'

  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
end
