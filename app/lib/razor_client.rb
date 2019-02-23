class RazorClient

  ENDPOINT = 'https://api.textrazor.com'

  attr_accessor :api_key

  def initialize(key)
    self.api_key = key
  end

  def analyze(text)
    params = { text: text, extractors: 'topics' }
    headers = { 'x-textrazor-key' => self.api_key }

    JSON.parse(RestClient.post(ENDPOINT, params, headers).body)
  end

  def topic_for(text)
    ap text
    analysis = analyze(text)
    ap analysis
    topics = analysis.dig('response', 'topics') || []
    topics.sample&.dig('label') || ''
  end
end
