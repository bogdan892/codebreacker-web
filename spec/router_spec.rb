# frozen_string_literal: true

RSpec.describe Router do
  include Constants
  def app
    Rack::Builder.parse_file('config.ru').first
  end
  include Rack::Test::Methods

  let(:game) { Codebreaker::Game.new('Petro', 'hard') }

  describe 'redirect to homepage' do
    before do
      get(Constants::HOME_URL)
    end

    it 'check to response' do
      expect(last_response).to be_ok
    end
  end

  describe 'redirect to game page' do
    before do
      env 'rack.session', game: game, hints: []
      post(Constants::GAME_URL)
    end

    it 'check to response' do
      expect(last_response).to be_ok
    end
  end

  describe 'redirect to rules page' do
    before do
      get(Constants::RULES_URL)
    end

    it 'check to response' do
      expect(last_response).to be_ok
    end
  end

  describe 'redirect to statistics page' do
    before do
      get(Constants::STATISTICS_URL)
    end

    it 'check to response' do
      expect(last_response).to be_ok
    end
  end

  describe 'redirect to invalid page' do
    before do
      get('/invalid_page')
    end

    it 'check to response' do
      expect(last_response.header['Location']).to eq(Constants::HOME_URL)
    end
  end

  describe 'redirect to lose page' do
    before do
      game.instance_variable_set(:@secret_code, '1234'.chars)
      game.instance_variable_set(:@attempts, 0)
      env 'rack.session', game: game, hints: []
      post '/game', number: '4321'
    end

    it 'check to response' do
      expect(last_response.header['Location']).to eq(Constants::LOSE_URL)
    end
  end

  describe 'redirect to win page' do
    before do
      game.instance_variable_set(:@secret_code, '1234'.chars)
      env 'rack.session', game: game, hints: []
      post '/game', number: '1234'
    end

    it 'check to response' do
      expect(last_response.header['Location']).to eq(Constants::WIN_URL)
    end
  end

  context 'when player give hint' do
    before do
      env 'rack.session', game: game, hints: []
      post '/game', hint: ''
    end

    it 'response with hint' do
      expect(last_request.session[:hints].size).to eq(1)
    end
  end
end
