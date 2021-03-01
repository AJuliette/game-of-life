#
# Requiring Your Gemfile
#

require 'rubygems'
require 'bundler/setup'

Bundler.require(:default)

#
# Require all the module you're creating here
#

require_relative "./lib/cell"
require_relative "./lib/cell_state_in_next_generation"
require_relative "./lib/mod"
require_relative "./lib/neighborhood"
require_relative "./lib/output"
require_relative "./lib/parser"
require_relative "./lib/transformer"

#
# v  Write your main loop downhere v
#
(1..10).to_a.each do |i|
  input = File.read("spec/fixtures/use_case_#{i}.txt")
  parsing = Parser.new(input).run
  transformed_field = Transformer.new(field: parsing[:positions], height: parsing[:height], width: parsing[:width]).run
  Output.new(generation_number: parsing[:generation_number], field_data: parsing[:field_data], transformed_field: transformed_field).run
end
#...
