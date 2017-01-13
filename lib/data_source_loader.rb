class DataSourceLoader
  SOURCE_TYPES = %w(sentinels sniffers loopholes).freeze

  attr_reader :records_sets

  def initialize
    @records_sets = []
  end

  def self.load(passphrase)
    instance = new
    SOURCE_TYPES.each do |type|
      pipeline = DataSourcePipeline.new(source_name: type, passphrase: passphrase)
      instance.records_sets << pipeline.process
    end
    instance
  end
end
