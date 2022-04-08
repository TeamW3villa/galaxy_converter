require 'spec_helper'

RSpec.describe UnitCalculator::RomanUnit do

  describe 'define constant ROMAN_MAP' do
    it 'has a ROMAN_MAP constant' do
      expect(UnitCalculator::RomanUnit::ROMAN_MAP).not_to be_nil
    end
  end

  describe "Can convert roman to numeral" do

    roman_string = 'MCMIII'

    context "Convert roman string to numeral" do
      it 'Should return 1903' do
        expect(UnitCalculator::RomanUnit.convert_to_numeral(roman_string: roman_string)).to be 1903
      end
    end

    context "when no parameters provided" do
      it { expect { UnitCalculator::RomanUnit.convert_to_numeral('test') }.to raise_error(ArgumentError) }
    end

  end

end
