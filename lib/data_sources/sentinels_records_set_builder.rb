require 'csv'

module DataSources
  class SentinelsRecordsSetBuilder
    SOURCE_NAME = 'sentinels'.freeze

    attr_reader :routes_file
    attr_reader :passphrase

    def initialize(routes_file: , passphrase: )
      @routes_file = routes_file
      @passphrase = passphrase
    end

    def build
      routes = read_source
      RecordsSet.new do |records|
        routes.each do |route|
          records.add({
            passphrase: passphrase,
            source: SOURCE_NAME,
            start_node: route['start_node'],
            end_node: route['end_node'],
            start_time: route['start_time'],
            end_time: route['end_time']
          })
        end
      end
    end

    private

    def read_source
      data = []
      CSV.foreach(routes_file, col_sep: ', ') do |row|
        data << {
          'start_node' => row[1],
          'end_node' => row[1],
          'start_time' => row[3],
          'end_time' => row[3]
        }
      end
      data
    end
  end
end
