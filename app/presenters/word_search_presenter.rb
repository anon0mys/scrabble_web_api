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
    if response.include?('No entry available')
      "'#{@word}' is not a valid word."
    else
      search_term = response[:results].first[:id]
      "'#{@word}' is a valid word and its root form is '#{search_term}'."
    end
  end
end
