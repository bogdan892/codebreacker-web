# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

ruby '2.7.2'

gem 'codebreaker',
    git: 'https://github.com/bogdan892/codebreaker-Ruby.git', branch: 'development'
gem 'erb', '~>2.2.3'
gem 'i18n', '~>1.8.10'
gem 'pry', '~>0.14.1'
gem 'rack', '~>2.2.3'
gem 'rack-test', '~>1.1.0'

group :development do
  gem 'rspec', '~>3.10.0'
  gem 'rubocop', '~>1.18.4'
  gem 'rubocop-performance', '~>1.11.4'
  gem 'rubocop-rspec', '~>2.4.0'
  gem 'simplecov', '~>0.21.2'
end
