require 'rails_helper'

describe Game do
  before(:all) do
    DatabaseCleaner.clean
    Rails.application.load_seed
  end

  after(:all) do
    DatabaseCleaner.clean
  end

  context 'instance methods' do
    context '#score_plays' do
      it 'should return the sum of a player\'s scores' do
        game = Game.find(1)

        expect(game.score_plays(game.player_1)).to eq(15)
        expect(game.score_plays(game.player_2)).to eq(16)
      end
    end
  end
end
