module DataSources
  class SniffersFactory < AbstractFactory
    # TODO handle file openning in other place. Handle file not exists and so on
    def records_set_builder
      DataSources::SniffersRecordsSetBuilder.new(
        routes_file: File.join(location, 'routes.csv'),
        node_times_file: File.join(location, 'node_times.csv'),
        sequences_file: File.join(location, 'sequences.csv'),
        passphrase: passphrase
      )
    end
  end
end
