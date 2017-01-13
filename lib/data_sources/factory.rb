module DataSources
  class Factory
    def self.build(source_name)
      if %w(loopholes sniffers sentinels).include?(source_name)
        self.class.const_get("#{source_name.capitalize}Factory").new #?
      end
    end
  end
end
