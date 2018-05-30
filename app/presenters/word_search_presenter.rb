class WordSearchPresenter
  attr_reader :service
  
  def initialize(word)
    @service = WordSearchService.new(word)
  end

  def result
    @service.validate_word
  end
end
