class Neo
  attr_reader :adventure

  def initialize(adventure)
    @adventure = adventure
  end

  def accept_adventure
    adventure.acceptance_path
  end

  def reject_adventure
    adventure.rejection_path
  end
end
