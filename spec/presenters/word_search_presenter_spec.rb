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
      it 'should validate a real word' do
        presenter = WordSearchPresenter.new('foxes')

        expected = "'foxes' is a valid word and its root form is 'fox'."

        expect(presenter.result).to eq(expected)
      end
    end
  end
end
