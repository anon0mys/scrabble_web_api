class WordSearchService
  def initialize(word)
    @word = word
    @conn = Faraday.new(url: "https://od-api.oxforddictionaries.com/api/v1/entries/en/#{word}")
  end

  def validate_word
    begin
      response = make_request
      JSON.parse(response.body, symbolize_names: true)
    rescue JSON::ParserError => e
      parse_error(e.message)
    end
  end

  private

  def make_request
    headers = {'app_id' => ENV['OXFORD_APP_ID'], 'app_key' => ENV['OXFORD_API_KEY']}
    @conn.get do |req|
      req.headers = headers
    end
  end

  def parse_error(message)
    if message.include?('No entry available')
      "'#{@word}' is not a valid word."
    end
  end
end
