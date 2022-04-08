module UnitCalculator
  class RomanUnit

    # Roman/numeral conversion
    ROMAN_MAP = [
      ["M",1000],
      ["CM",900],
      ["D",500],
      ["CD",400],
      ["C",100],
      ["XC",90],
      ["L",50],
      ["XL",40],
      ["X",10],
      ["IX",9],
      ["V",5],
      ["IV",4],
      ["I",1]
    ].freeze

    # Converting roman string to numeral
    def self.convert_to_numeral(roman_string: '')
      sum = 0
      ROMAN_MAP.each do |arr|
        key, value = arr
        while roman_string.index(key) == 0
          sum += value
          roman_string.slice!(key)
        end
      end
      sum
    end
  end
end