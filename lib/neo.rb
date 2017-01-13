class Neo
  attr_reader :adventure

  def initialize(adventure)
    @adventure = adventure
  end

  def accept_adventure
    adventure.red_pill
  end

  def reject_adventure
    adventure.blue_pill
  end
end
