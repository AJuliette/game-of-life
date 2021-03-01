class Output
  def initialize(generation_number:, field_data:, transformed_field:)
    @generation_number = generation_number
    @field_data = field_data
    @transformed_field = transformed_field
  end

  def run
    file = File.new("spec/fixtures/use_case_#{ @generation_number + 1}.txt", "w")
    file.puts(
      [
        "Generation #{ @generation_number + 1 }:",
        @field_data,
        @transformed_field
      ].join("\n")
    )
    file.close
  end
end
