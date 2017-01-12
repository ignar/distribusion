class PillsBuilder
  attr_reader :pill

  def initialize
    @pill = Pill.new
  end

  def set_color(color)
    @pill.color = color
  end

  def set_location(location)
    @pill.location = location
  end

  def set_passphrase(passphrase)
    @pill.passphrase = passphrase
  end
end
