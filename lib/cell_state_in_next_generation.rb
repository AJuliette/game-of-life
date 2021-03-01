class CellStateInNextGeneration
  def initialize(neighbours:, cell:)
    @cell = cell
    @neighbours = neighbours
    @number_of_dead_neighbours = @neighbours['.']
    @number_of_live_neighbours = @neighbours['*']
  end

  def run
    if live
      '*'
    else
      '.'
    end
  end

  def die
    (@cell.alive? && (@number_of_live_neighbours < 2 || @number_of_live_neighbours > 3))
  end

  def live
    @cell.dead? && @number_of_live_neighbours == 3 || (@cell.alive? && (@number_of_live_neighbours == 2 || @number_of_live_neighbours == 3))
  end
end
