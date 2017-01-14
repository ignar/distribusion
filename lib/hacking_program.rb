require 'logger'

class HackingProgram
  attr_accessor :passphrase
  attr_accessor :records_sets
  attr_accessor :terminal
  attr_reader :logger

  def initialize(logger: Logger.new(STDOUT))
    @logger = logger
  end

  # TODO Refactor Violates SRP
  def load_collected_info(loader: DataSourceLoader, passphrase:)
    self.records_sets = loader.load(passphrase)
  end

  def hack
    catch :neo_is_found do
      records_sets.each do |record_set|
        record_set.each do |record|
          # TODO Refactor. Execution of command have to be in separte class
          # Violates SRP
          answer = terminal.import_parsed_data(record.to_json)
          logger.info("STATUS #{answer.status}")
          display_message(answer)

          if answer.successful?
            throw :neo_is_found
          end
        end
      end
    end
  end

  private

  # TODO Refactor
  # This violates SRP. Should be moved to separate class
  def display_message(answer)
    severity = answer.successful? ? :info : :error

    data = JSON.parse(answer.data)
    data.each do |k, v|
      logger.send(severity, v)
    end
  end
end
