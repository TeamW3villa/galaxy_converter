require 'spec_helper'

RSpec.describe UnitCalculator::MetalUnit do

  before do
    UnitCalculator::GalaxyUnit.calculate_galaxy_unit_value(galaxy_unit: 'glob', roman_numeral: 'I')
    UnitCalculator::GalaxyUnit.calculate_galaxy_unit_value(galaxy_unit: 'prok', roman_numeral: 'V')
    UnitCalculator::GalaxyUnit.calculate_galaxy_unit_value(galaxy_unit: 'pish', roman_numeral: 'X')
  end

  describe "#calculate_metal_value" do

    before do
      UnitCalculator::MetalUnit.calculate_metal_value(galaxy_units_array: ['glob', 'prok'], metal: 'Gold', credits: 57800)
    end
    
    context "given three parameters :galaxy_units_array, :metal and :credits " do
      it 'Should return metal value Gold' do
        metal_value = 57800 / UnitCalculator::GalaxyUnit.convert_to_numeral(galaxy_units_array: ['glob', 'prok']).to_f
        expect(UnitCalculator::MetalUnit.get_metal_value('Gold')).to eq(metal_value)
      end
    end

    context "when no parameters provided" do
      it { expect { UnitCalculator::MetalUnit.calculate_metal_value('test') }.to raise_error(ArgumentError) }
    end

  end

  describe "#convert_to_numeral" do

    before do 
      UnitCalculator::MetalUnit.calculate_metal_value(galaxy_units_array: ['pish', 'pish'], metal: 'Iron', credits: 3910) 
    end

    context "given two parameters :galaxy_units_array and :metal'" do
      it 'Should return 782' do
        expect(UnitCalculator::MetalUnit.convert_to_numeral(galaxy_units_array: ['glob', 'prok'], metal: 'Iron')).to eq 782
      end
    end

    context "when no parameters provided" do
      it { expect { UnitCalculator::MetalUnit.convert_to_numeral('foo') }.to raise_error(ArgumentError) }
    end

  end


end
