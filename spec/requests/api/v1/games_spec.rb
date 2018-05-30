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
    # When I send a POST request to "/api/v1/games/1/plays" with a user_id=1 and word=at
    # Then I should receive a 201 Created Response
    #
    # When I send a GET request to "/api/v1/games/1" I receive a JSON response as follows:
    #
    # {
    #   "game_id":1,
    #   "scores": [
    #     {
    #       "user_id":1,
    #       "score":17
    #     },
    #     {
    #       "user_id":2,
    #       "score":16
    #     }
    #   ]
    # }
  end
end
