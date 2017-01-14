require 'uri'
require 'json'

# TODO Add decorator for logging facilities
# TODO It doesn't hold http errors. Have to be improved
class Terminal
  DOMAIN = 'http://challenge.distribusion.com'.freeze
  THE_ONE = 'the_one'.freeze
  ROUTES = 'the_one/routes'.freeze

  # TODO Move to separte class. Cover with tests
  class ImportAnswer
    attr_accessor :status
    attr_accessor :data

    def successful?
      status == 200 || status == 201
    end
  end

  class << self
    def receive_warning
      get_json(THE_ONE)
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
      response = adapter.post do |req|
        req.url url
        req.body = args.to_json
        req.headers['Content-Type'] = 'application/json'
        req.headers['Accept'] = 'application/json'
      end
    end

    # TODO handle non-json answers and errors
    def get_json(url, args = {})
      response = adapter.get(url, args) do |req|
        req.headers['Content-Type'] = 'application/json'
        req.headers['Accept'] = 'application/json'
      end
      body = response.body
      JSON.parse(body)
    end
  end
end
