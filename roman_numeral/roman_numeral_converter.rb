class RomanNumeralConverter

  CONVERSION_TABLE = [
    [10, 'X'],
    [9, 'IX'],
    [5, 'V'],
    [4, 'IV'],
    [1, 'I']
  ]

  def convert(number)
    result = ''
    CONVERSION_TABLE.each do |int, roman|
      while number >= int do
        result << roman
        number -= int
      end
    end
    result
  end
end
