class HackingProgram
  attr_accessor :passphrase
  attr_accessor :records_sets
  attr_accessor :terminal

  def hack(logger: Logger.new(STDOUT))
    catch :neo_is_found do
      records_sets.each do |record_set|
        record_set.each do |record|
          answer = terminal.import_parsed_data(record.to_json)
          logger.info "STATUS #{answer.status}"
          logger.info answer.data
          if answer.successful?
            throw :neo_is_found
          end
        end
      end
    end
  end
end
