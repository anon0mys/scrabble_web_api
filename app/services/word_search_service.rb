class WordSearchService
  def initialize(word)
    @conn = Faraday.new(url: "https://od-api.oxforddictionaries.com/api/v1/inflections/en/#{word}")
  end

  def validate_word
    begin
      response = make_request
      JSON.parse(response.body, symbolize_names: true)
    rescue JSON::ParserError => e
      e.message
    end
  end

  private

  def make_request
    headers = {'app_id' => ENV['OXFORD_APP_ID'], 'app_key' => ENV['OXFORD_API_KEY']}
    @conn.get do |req|
      req.headers = headers
    end
  end
end
