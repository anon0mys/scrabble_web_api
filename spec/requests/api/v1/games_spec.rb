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

  context 'POST /api/v1/games/1/plays' do
    it 'should allow a user to post a word and update their score' do
      params = { user_id: 1, word: 'at' }

      post '/api/v1/games/1/plays', params: params

      expect(response.status).to eq(201)

      get '/api/v1/games/1'

      expected_json = { game_id: 1,
                        scores: [
                          { user_id: 1,
                            score: 17 },
                          { user_id: 2,
                            score: 16 }
                        ] }.to_json

      expect(response).to eq(expected_json)
    end
  end
end
