module DataSources
  class Factory
    def self.build(source_name:, location:, passphrase:)
      if %w(loopholes sniffers sentinels).include?(source_name)
        factory = self.class.const_get("DataSources::#{source_name.capitalize}Factory")
        factory.new(location: location, passphrase: passphrase)
      end
    end
  end
end
