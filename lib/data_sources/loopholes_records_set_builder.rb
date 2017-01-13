module DataSources
  class LoopholesRecordsSetBuilder
    SOURCE_NAME = 'loopholes'.freeze

    attr_reader :routes
    attr_reader :node_pairs
    attr_reader :passphrase

    def initialize(routes_file: , node_pairs_file: , passphrase: )
      @passphrase = passphrase
      @routes = read_source(routes_file)
      @node_pairs = read_source(node_pairs_file)
    end

    def build
      RecordsSet.new do |records|
        routes.each do |route|
          node_pair = find_node_pair(route['node_pair_id'])
          next unless node_pair

          records.add({
            passphrase: passphrase,
            source: SOURCE_NAME,
            start_node: node_pair['start_node'],
            end_node: node_pair['end_node'],
            start_time: route['start_time'],
            end_time: route['end_time']
          })
        end
      end
    end

    private

    def read_source(file)
      content = File.read(file)
      json = JSON.parse(content)
      json[filename(file)]
    end

    def filename(file)
      File.basename(file, '.*')
    end

    def find_node_pair(id)
      node_pairs.find { |e| e['id'] == id }
    end
  end
end
