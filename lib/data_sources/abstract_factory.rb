module DataSources
  class AbstractFactory
    attr_reader :location
    attr_reader :passphrase

    def initialize(location:, passphrase:)
      @location = location
      @passphrase = passphrase
    end

    def records_set_builder
      raise NotImplementedError
    end
  end
end
