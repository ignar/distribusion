class DataSourceLoader
  SOURCE_TYPES = %w(sentinels sniffers loopholes).freeze

  attr_reader :data_sources

  def initialize
    @data_sources = []
  end

  def self.load
    instance = new
    SOURCE_TYPES.each do |type|
      pipeline = DataSourcePipeline.new(source_name: type)
      instance.data_sources << pipeline.process
    end
    instance
  end
end
