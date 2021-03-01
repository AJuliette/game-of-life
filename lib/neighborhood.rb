class Neighborhood
  def initialize(cell:, field:)
    @x_coordinate = cell.x_coordinate
    @y_coordinate = cell.y_coordinate
    @field = field
  end

  def neighbours_positions
    [
      [@y_coordinate - 1, @x_coordinate],
      [@y_coordinate + 1, @x_coordinate], 
      [@y_coordinate, @x_coordinate - 1],
      [@y_coordinate, @x_coordinate + 1],
      [@y_coordinate - 1, @x_coordinate -1],
      [@y_coordinate + 1, @x_coordinate + 1], 
      [@y_coordinate + 1, @x_coordinate - 1],
      [@y_coordinate - 1, @x_coordinate + 1],
    ]
  end

  def neighbours_list
    neighbours_positions.each_with_object([]) do |position, array|
      array << @field[position]
    end.reject { |c| c.nil? }
  end

  def classified_neighborhood
    neighbours_list.inject(Hash.new(0)) { |total, e| total[e] += 1 ; total}
  end
end
