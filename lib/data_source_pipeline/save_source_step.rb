class DataSourcePipeline
  class SaveSourceStep
    attr_reader :source_name
    attr_reader :data
    attr_reader :destination_dir

    def initialize(source_name, data, destination_dir)
      @source_name = source_name
      @data = data
      @destination_dir = destination_dir
    end

    def call
      write_file
    end

    def self.call(source_name: , data: , destination_dir: )
      new(source_name, data, destination_dir).call
    end

    private

    def compose_file_name
      FileUtils.mkdir_p(source_name)
      File.join(source_name, "#{source_name}.zip")
    end

    def write_file
      in_destination_dir do
        cleanup_files_if_exist
        File.open(compose_file_name, 'w') do |f|
          f.write(data)
        end
        File.join(destination_dir, compose_file_name)
      end
    end

    def cleanup_files_if_exist
      extracted_dir_name = File.join(source_name)
      if Dir.exist?(extracted_dir_name)
        FileUtils.rm_r(extracted_dir_name)
      end
    end

    def in_destination_dir(&block)
      Dir.chdir(destination_dir) do
        block.call
      end
    end
  end
end
