class DataSourceLoader
  SOURCE_TYPES = %w(sentinels loopholes sniffers).freeze

  def self.load(passphrase)
    collection = []
    SOURCE_TYPES.each do |type|
      pipeline = DataSourcePipeline.new(source_name: type, passphrase: passphrase)
      collection << pipeline.process
    end
    collection
  end
end
