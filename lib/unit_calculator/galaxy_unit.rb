module UnitCalculator
  class GalaxyUnit
    @galaxy_units_values ||= {} #{"glob"=>"I", "prok"=>"V", "pish"=>"X", "tegj"=>"L"}

    def self.get_galaxy_values(galaxy_unit)
      @galaxy_units_values[galaxy_unit]
    end

    def self.calculate_galaxy_unit_value(galaxy_unit: , roman_numeral: )
      @galaxy_units_values[galaxy_unit] = roman_numeral
    end

    def self.convert_to_numeral(galaxy_units_array: [])
      RomanUnit.convert_to_numeral(roman_string: convet_to_roman_string(galaxy_units_array))
    end

    # Converts galaxy units array to a roman string
    def self.convet_to_roman_string galaxy_units_array
      galaxy_units_array.map{|galaxy_unit| get_galaxy_values(galaxy_unit)}.join
    end
  end
end