class Transformer
  def initialize(field:, width:, height:)
    @field = field
    @width = width
    @height = height
  end

  def run
    array = @field.each_with_object([]) do |(cell_position, cell_state), array|
      classified_neighborhood = Neighborhood.new(position: cell_position, field: @field).classified_neighborhood
      state = CellStateInNextGeneration.new(cell: Cell.new(state: cell_state), neighbours: classified_neighborhood).run
      array << state
    end

    (1..@height).to_a.each_with_object([]) do |height, new_array|
      new_array << [array.shift(@width).join]
    end
  end
end
