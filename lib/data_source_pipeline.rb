class DataSourcePipeline
  attr_reader :destination_dir
  attr_reader :source_name

  def initialize(source_name: , destination_dir: File.join(Dir.pwd, 'tmp'))
    @destination_dir = destination_dir
    @source_name = source_name
  end

  def process
    data = DataSourcePipeline::LoadSourceStep.call(
      source_name: source_name,
      passphrase: ''
    )
    archive_location = DataSourcePipeline::SaveSourceStep.call(
      source_name: source_name,
      data: data,
      destination_dir: destination_dir
    )
    location = DataSourcePipeline::UnzipSourceStep.call(
      source_name: source_name,
      archive_location: archive_location
    )
    data_source = DataSourcePipeline::ProcessSourceStep.call(
      source_name: source_name,
      location: location
    )
  end
end
