# frozen_string_literal: true

RSpec.describe CheckGameStatus do
  def app
    Rack::Builder.parse_file('config.ru').first
  end

  context 'when check if game active' do
    it 'from game url' do
      get(Constants::GAME_URL)
      expect(last_response.header['Location']).to eq(Constants::HOME_URL)
    end

    it 'from win url' do
      get(Constants::WIN_URL)

      expect(last_response.header['Location']).to eq(Constants::HOME_URL)
    end

    it 'from lose url' do
      get(Constants::LOSE_URL)

      expect(last_response.header['Location']).to eq(Constants::HOME_URL)
    end
  end
end
