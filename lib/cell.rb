class Cell
  def initialize(state:, position:)
    @position = position
    @state = state
  end

  def alive?
    @state == '*'
  end

  def dead?
    @state == '.'
  end

  def x_coordinate
    @position[1]
  end

  def y_coordinate
    @position[0]
  end
end
