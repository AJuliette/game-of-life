class Parser
  def initialize(input)
    @input = input
    @hash = {}
  end

  def run
    parsing
    response
  end

  def parsing
    scanner = StringScanner.new(@input)
    scanner.skip(/Generation /)
    @hash[:generation_number] = scanner.scan_until(/[0-9]+/).to_i
    scanner.skip(/:\n/)
    field = scanner.scan_until(/[0-9]+ [0-9]+/)
    sizes = field.split(" ")
    @hash[:width] = sizes[1].to_i
    @hash[:height] = sizes[0].to_i
    @hash[:field] = "#{@hash[:height] } #{@hash[:width]}"
    scanner.skip(/\n/)

    @hash[:positions] = (1..@hash[:height]).to_a.each_with_object({}) do |line, hash|
      (1..@hash[:width]).to_a.each do |column|
        cell = scanner.scan_until(/\*|\./)
        hash[[line, column]] = cell
        scanner.skip(/\n/)
      end
    end
  end

  def response
    {
      generation_number: @hash[:generation_number],
      field_data: @hash[:field],
      width: @hash[:width],
      height: @hash[:height],
      positions: @hash[:positions],
    }
  end
end
