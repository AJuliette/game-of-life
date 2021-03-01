class Cell
  def initialize(state:)
    @state = state
  end

  def alive?
    @state == '*'
  end

  def dead?
    @state == '.'
  end
end
