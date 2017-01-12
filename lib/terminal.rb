require 'uri'

class Terminal
  DOMAIN = 'http://challenge.distribusion.com'.freeze
  THE_ONE_URL = 'the_one'.freeze

  class << self
    def receive_warning
      get(THE_ONE_URL)
    end

    private

    def adapter
      Faraday.new(url: DOMAIN)
    end

    # TODO handle non-json answers and errors
    def get(url)
      response = adapter.get(url)
      body = response.body
      JSON.parse(body)
    end
  end
end
