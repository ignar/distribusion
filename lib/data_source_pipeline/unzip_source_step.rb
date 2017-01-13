require 'zip'

class DataSourcePipeline
  class UnzipSourceStep
    attr_reader :source_name
    attr_reader :archive_location

    def initialize(source_name, archive_location)
      @source_name = source_name
      @archive_location = archive_location
    end

    def call
      unzip
    end

    def self.call(source_name: , archive_location: )
      new(source_name, archive_location).call
    end

    private

    def unzip
      Zip::File.open(archive_location) do |zip_file|
        zip_file.each do |entry|
          entry.extract(destination_location(entry.name))
        end
      end
      base_path
    end

    def base_path
      File.dirname(archive_location)
    end

    def destination_location(name)
      File.join(base_path, name)
    end
  end
end
