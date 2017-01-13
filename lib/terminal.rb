require 'uri'

class Terminal
  DOMAIN = 'http://challenge.distribusion.com'.freeze
  THE_ONE_URL = 'the_one'.freeze
  ROUTES = 'routes'.freeze

  class << self
    def receive_warning
      get_json(THE_ONE_URL)
    end

    def load_source(source, passphrase)
      get(ROUTES, source: source, passphrase: passphrase)
    end

    private

    def adapter
      Faraday.new(url: DOMAIN)
    end

    def get(url, args = {})
      response = adapter.get(url, args)
      body = response.body
    end

    # TODO handle non-json answers and errors
    def get_json(url, args = {})
      response = adapter.get(url, args)
      body = response.body
      JSON.parse(body)
    end
  end
end
