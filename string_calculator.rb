class StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?

    if numbers.start_with?("//")
      delimiter, numbers = extract_delimiter_and_numbers(numbers)
    else
      delimiter = /[\n,]/ # Default delimiter is comma or newline
    end

    nums = numbers.split(delimiter)

    negatives = nums.select { |num| num.to_i < 0 }
    raise "negative numbers not allowed #{negatives.join(', ')}" unless negatives.empty?

    sum = nums.map(&:to_i).sum
    sum
  end

  private

  def self.extract_delimiter_and_numbers(numbers)
    delimiter_line, numbers = numbers.split("\n", 2)
    delimiter = delimiter_line[2..-1] 
    delimiter = Regexp.escape(delimiter)
    delimiter = /[\n#{delimiter}]/ 
    [delimiter, numbers]
  end
end
