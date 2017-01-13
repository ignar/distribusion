class Adventure
  attr_reader :pills

  def initialize(pills = {})
    @pills = pills
  end

  def self.start(terminal = Terminal)
    pills = {}
    message = terminal.receive_warning
    if message.has_key?('pills')
      message['pills'].each do |color, entity|
        builder = PillsBuilder.new
        builder.set_color(color)
        builder.set_location(entity.fetch('location', nil))
        builder.set_passphrase(entity.fetch('passphrase', nil))

        pills[color.to_sym] = builder.pill
      end
    end

    new(pills)
  end

  def red_pill
    pills.fetch(:red)
  end

  def blue_pill
    pills.fetch(:blue)
  end
end
