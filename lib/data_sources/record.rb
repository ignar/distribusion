module DataSources
  class Record
    attr_reader :source, :passphrase, :start_node, :end_node, :start_time, :end_time

    def initialize(params = {})
      params.each do |k, v|
        instance_variable_set("@#{k}".to_sym, v)
      end
    end

    def to_json
      {
        source: source,
        passphrase: passphrase,
        start_node: start_node,
        end_node: end_node,
        start_time: start_time,
        end_time: end_time
      }
    end
  end
end
