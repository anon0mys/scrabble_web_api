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
    end
  end
end
