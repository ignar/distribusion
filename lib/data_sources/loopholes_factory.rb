module DataSources
  class LoopholesFactory < AbstractFactory
    def records_set_builder
      DataSources::LoopholesRecordsSetBuilder.new(
        routes_file: File.join(location, 'routes.json'),
        node_pairs_file: File.join(location, 'node_pairs.json'),
        passphrase: passphrase
      )
    end
  end
end
