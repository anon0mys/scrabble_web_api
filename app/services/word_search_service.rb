class WordSearchService
  def initialize(word)
    @conn = Faraday.new(url: 'https://od-api.oxforddictionaries.com')
    @word = word
  end

  def validate_word
    begin
      endpoint = '/api/v1/inflections/en/' + @word
      response = make_request(endpoint)
      JSON.parse(response.body, symbolize_names: true)
    rescue JSON::ParserError => e
      e.message
    end
  end

  private

  def make_request(endpoint)
    headers = {'app_id' => ENV['OXFORD_APP_ID'], 'app_key' => ENV['OXFORD_API_KEY']}
    @conn.get do |req|
      req.headers = headers
      req.url endpoint
    end
  end
end
