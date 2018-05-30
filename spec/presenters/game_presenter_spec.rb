require 'rails_helper'

describe GamePresenter do
  before(:all) do
    DatabaseCleaner.clean
    Rails.application.load_seed
  end

  after(:all) do
    DatabaseCleaner.clean
  end

  context 'instance methods' do
    context '#stats' do
      it 'should return a hash of players and scores' do
        game = Game.find(1)
        presenter = GamePresenter.new(game)

        expected = { game_id: 1,
                      scores: [
                        { user_id: 1,
                          score: 15 },
                        { user_id: 2,
                          score: 16 }
                      ] }

        expect(presenter.stats).to eq(expected)
      end
    end
  end
end
