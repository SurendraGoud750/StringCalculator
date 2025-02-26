# spec/string_calculator_spec.rb
require 'string_calculator'

RSpec.describe StringCalculator do
  describe '.add' do
    it 'returns 0 for an empty string' do
      expect(StringCalculator.add("")).to eq(0)
    end

    it 'returns the number itself for a single number' do
      expect(StringCalculator.add("1")).to eq(1)
    end

    it 'returns the sum of numbers separated by commas' do
      expect(StringCalculator.add("1,2,3")).to eq(6)
    end

    it 'returns the sum of numbers separated by newlines' do
      expect(StringCalculator.add("4\n5\n6")).to eq(15)
    end

    it 'returns the sum of numbers with mixed delimiters' do
      expect(StringCalculator.add("1,2\n3")).to eq(6)
    end

    it 'handles custom delimiter (semicolon)' do
      expect(StringCalculator.add("//;\n1;2")).to eq(3)
    end

    it 'handles custom delimiter (pipe)' do
      expect(StringCalculator.add("//|\n1|2|3")).to eq(6)
    end

    it 'throws an exception if there are negative numbers' do
      expect { StringCalculator.add("1,-2,3") }.to raise_error("negative numbers not allowed -2")
    end

    it 'throws an exception with multiple negative numbers' do
      expect { StringCalculator.add("//;\n1;-2;-3;4") }.to raise_error("negative numbers not allowed -2, -3")
    end
  end
end
