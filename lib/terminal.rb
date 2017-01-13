require 'uri'

class Terminal
  DOMAIN = 'http://challenge.distribusion.com'.freeze
  THE_ONE_URL = 'the_one'.freeze
  ROUTES = 'routes'.freeze

  class ImportAnswer
    attr_accessor :status
    attr_accessor :data

    def successful?
      status == 200 || status == 201
    end
  end

  class << self
    def receive_warning
      get_json(THE_ONE_URL)
    end

    def load_source(source, passphrase)
      get(ROUTES, source: source, passphrase: passphrase)
    end

    def import_parsed_data(args)
      result = post(ROUTES, args)
      ImportAnswer.new.tap do |a|
        a.status = result.status
        a.data = result.body
      end
    end

    private

    def adapter
      Faraday.new(url: DOMAIN)
    end

    def get(url, args = {})
      response = adapter.get(url, args)
      body = response.body
    end

    def post(url, args = {})
      response = adapter.post(url, args)
    end

    # TODO handle non-json answers and errors
    def get_json(url, args = {})
      response = adapter.get(url, args)
      body = response.body
      JSON.parse(body)
    end
  end
end
