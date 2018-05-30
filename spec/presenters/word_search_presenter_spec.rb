require 'rails_helper'

describe WordSearchPresenter do
  context 'initialization' do
    it 'should initailize with a service' do
      presenter = WordSearchPresenter.new('foxes')

      expect(presenter.service).to be_a WordSearchService
    end
  end

  context 'instance methods' do
    context '#result' do
      it 'should create a response for a real word' do
        presenter = WordSearchPresenter.new('foxes')

        expected = "'foxes' is a valid word and its root form is 'fox'."

        expect(presenter.result).to eq(expected)
      end

      it 'should create a different response for a fake word' do
        presenter = WordSearchPresenter.new('foxez')

        expected = "'foxez' is not a valid word."

        expect(presenter.result).to eq(expected)
      end
    end

    context '#valid_word?' do
      it 'should validate a real word' do
        presenter = WordSearchPresenter.new('foxes')

        expect(presenter.valid_word?).to be true
      end

      it 'should not validate a fake word' do
        presenter = WordSearchPresenter.new('foxez')

        expect(presenter.valid_word?).to be false
      end
    end
  end
end
