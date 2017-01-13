class DataSourcePipeline
  class ProcessSourceStep
    attr_reader :source_name, :location, :passphrase

    def initialize(source_name, location, passphrase)
      @source_name, @location, @passphrase = source_name, location, passphrase
    end

    def call
      factory = DataSources::Factory.build(
        source_name: source_name,
        location: location,
        passphrase: passphrase
      )
      builder = factory.records_set_builder
      builder.build
    end

    def self.call(source_name: , location: , passphrase:)
      new(source_name, location, passphrase).call
    end
  end
end
