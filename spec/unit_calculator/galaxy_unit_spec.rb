require 'spec_helper'

RSpec.describe UnitCalculator::GalaxyUnit do

  describe "#calculate_galaxy_unit_value" do

    before do 
      UnitCalculator::GalaxyUnit.calculate_galaxy_unit_value(galaxy_unit: 'glob', roman_numeral: 'I')
    end

    context "Success" do
      it '' do
        expect(UnitCalculator::GalaxyUnit.get_galaxy_values('glob')).to eq('I')
      end
    end

    context "when no parameters provided" do
      it { expect { UnitCalculator::GalaxyUnit.calculate_galaxy_unit_value('foo') }.to raise_error(ArgumentError) }
    end

  end

  describe "#convert_to_numeral" do

    before do 
      UnitCalculator::GalaxyUnit.calculate_galaxy_unit_value(galaxy_unit: 'glob', roman_numeral: 'I')
      UnitCalculator::GalaxyUnit.calculate_galaxy_unit_value(galaxy_unit: 'prok', roman_numeral: 'V')
    end

    context "Success" do
      it '' do
        expect(UnitCalculator::GalaxyUnit.convert_to_numeral(galaxy_units_array: ['glob', 'prok'])).to be 4
      end
    end

    context "when no parameters provided" do
      it { expect { UnitCalculator::GalaxyUnit.convert_to_numeral('test') }.to raise_error(ArgumentError) }
    end

  end

end
