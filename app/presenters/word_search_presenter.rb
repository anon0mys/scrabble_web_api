class WordSearchPresenter
  attr_reader :service

  def initialize(word)
    @word = word
    @service = WordSearchService.new(word)
  end

  def result
    @response ||= @service.validate_word
    evaluate_response(@response)
  end

  def valid_word?
    result.include?('is a valid word')
  end

  private

  def evaluate_response(response)
    if response.include?('Not Found')
      "'#{@word}' is not a valid word."
    else
      search_term = response[:results].first[:id]
      root = response[:results].first[:lexicalEntries].first[:inflectionOf].first[:id]
      "'#{search_term}' is a valid word and its root form is '#{root}'."
    end
  end
end
