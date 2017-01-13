class DataSourcePipeline
  attr_reader :destination_dir
  attr_reader :source_name
  attr_reader :passphrase

  def initialize(source_name: , passphrase: , destination_dir: File.join(Dir.pwd, 'tmp'))
    @destination_dir = destination_dir
    @source_name = source_name
    @passphrase = passphrase
  end

  def process
    data = DataSourcePipeline::LoadSourceStep.call(
      source_name: source_name,
      passphrase: passphrase
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
    records_set = DataSourcePipeline::ProcessSourceStep.call(
      source_name: source_name,
      location: location,
      passphrase: passphrase
    )
  end
end
