module DataSources
  class SentinelsFactory < AbstractFactory
    def records_set_builder
      DataSources::SentinelsRecordsSetBuilder.new(
        routes_file: File.join(location, 'routes.csv'),
        passphrase: passphrase
      )
    end
  end
end
