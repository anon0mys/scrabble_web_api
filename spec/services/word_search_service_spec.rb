require 'rails_helper'

describe WordSearchService do
  context 'instance methods' do
    context '#validate_word' do
      it 'should validate a real word' do
        service = WordSearchService.new('foxes')
        response = File.read('./spec/fixtures/json/valid_word_search.json')
        expected = JSON.parse(response, symbolize_names: true)

        expect(service.validate_word).to eq(expected)
      end

      it 'should not validate a made up word' do
        service = WordSearchService.new('foxez')

        expected = "743: unexpected token at '<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 3.2 Final//EN\">\n<title>404 Not Found</title>"

        expect(service.validate_word).to include(expected)
      end
    end
  end
end
