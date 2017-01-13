module DataSources
  class SniffersRecordsSetBuilder
    SOURCE_NAME = 'loopholes'.freeze

    attr_reader :routes
    attr_reader :node_times
    attr_reader :sequences
    attr_reader :passphrase

    def initialize(routes_file: , node_times_file: , sequences_file: , passphrase: )
      @routes_file = routes_file
      @node_times_file = node_times_file
      @sequences_file = sequences_file
      @passphrase = passphrase
    end

    def build
      read_sources!
      RecordsSet.new do |records|
        sequences.each do |sequence|
          route = find_relation(routes, 'route_id', sequence['route_id'])
          node_time = find_relation(node_times, 'node_time_id', sequence['node_time_id'])

          next if !route || !node_time
          records.add({
            passphrase: passphrase,
            source: SOURCE_NAME,
            start_node: node_time['start_node'],
            end_node: node_time['end_node'],
            start_time: route['time'],
            end_time: calculate_end_time(route['time'], node_time['duration_in_milliseconds'])
          })
        end
      end
    end

    private

    def read_sources!
      @routes = read_routes_source(@routes_file)
      @node_times = read_node_times_source(@node_times_file)
      @sequences = read_sequences_source(@sequences_file)
    end

    def find_relation(source, field, value)
      source.find { |e| e[field] == value }
    end

    def calculate_end_time(time, offset)
      result = Time.parse(time) + (offset.to_i/1000)
      result.to_s
    end

    def read_routes_source(file)
      data = []
      CSV.foreach(file, col_sep: ', ', headers: true, encoding: 'UTF-8') do |row|
        data << {
          'route_id' => row[0],
          'time' => row[1]
        }
      end
      data
    end

    def read_node_times_source(file)
      data = []
      CSV.foreach(file, col_sep: ', ', headers: true, encoding: 'UTF-8') do |row|
        data << {
          'node_time_id' => row[0],
          'start_node' => row[1],
          'end_node' => row[2],
          'duration_in_milliseconds' => row[3]
        }
      end
      data
    end

    def read_sequences_source(file)
      data = []
      CSV.foreach(file, col_sep: ', ', headers: true, encoding: 'UTF-8') do |row|
        data << {
          'route_id' => row[0],
          'node_time_id' => row[1]
        }
      end
      data
    end

    def filename(file)
      File.basename(file, '.*')
    end
  end
end
