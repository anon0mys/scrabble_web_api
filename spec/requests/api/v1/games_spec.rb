require 'rails_helper'

describe 'API::V1::Games' do
  before(:all) do
    DatabaseCleaner.clean
    Rails.application.load_seed
  end

  after(:all) do
    DatabaseCleaner.clean
  end

  context 'GET /api/v1/games/1' do
    it 'should respond with game and player information' do
      get '/api/v1/games/1'

      expect(response).to be_success

      expected_json = { game_id: 1,
                        scores: [
                          { user_id: 1,
                            score: 15 },
                          { user_id: 2,
                            score: 16 }
                        ] }.to_json


      expect(response.body).to eq(expected_json)
    end
  end
end
