Dir[File.join(__dir__, 'unit_calculator', '**/*.rb')].each {|file| require file }

class FileParser

  def self.process(line)
    case line
    when /^([a-z]+) is ([I|V|X|L|C|D|M])$/
      UnitCalculator::GalaxyUnit.calculate_galaxy_unit_value(galaxy_unit: $1, roman_numeral: $2)
    when /^([a-z ]+)([A-Z]\w+) is (\d+) Credits$/
      UnitCalculator::MetalUnit.calculate_metal_value(galaxy_units_array: $1.split, metal: $2, credits: $3)
    when /^how much is ((\w+ )+)\?$/
      result = UnitCalculator::GalaxyUnit.convert_to_numeral(galaxy_units_array: $1.split)
      puts "#{$1}is #{result} Credits"
    when /^how many Credits is ([a-z ]+)([A-Z]\w+) \?$/
      result = UnitCalculator::MetalUnit.convert_to_numeral(galaxy_units_array: $1.split, metal: $2)
      puts "#{$1}#{$2} is #{result} Credits"
    else
      puts "I have no idea what you are talking about"
    end
  end

  def self.read_input_file(file_name)
    File.read(file_name).each_line { |line| process(line) }
  end
end