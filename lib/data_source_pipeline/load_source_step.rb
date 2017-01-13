class DataSourcePipeline
  class LoadSourceStep
    attr_reader :source_name
    attr_reader :passphrase

    def initialize(source_name, passphrase)
      @source_name = source_name
      @passphrase = passphrase
    end

    def call
      Terminal.load_source(source_name, passphrase)
    end

    def self.call(source_name: , passphrase: )
      new(source_name, passphrase).call
    end
  end
end
