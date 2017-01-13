module DataSources
  class LoopholesFactory < AbstractFactory
    def builder
      DataSources::LoopholesRecordsSetBuilder.new(
        routes_file: File.join(location, 'routes.csv'),
        node_pairs_file: File.join(location, 'node_pairs.csv'),
        passphrase: passphrase
      )
    end
  end
end
