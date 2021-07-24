# frozen_string_literal: true

RSpec.describe GameController do
  def app
    Rack::Builder.parse_file('config.ru').first
  end

  context 'when game active' do
    before do
      post Constants::HOME_URL, player_name: 'Boris', level: 'easy'
    end

    it 'game redirect to active game' do
      expect(last_response.header['Location']).to eq(Constants::GAME_URL)
    end
  end
end
