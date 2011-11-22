require 'rspec/given'
require_relative 'roman_numeral_converter'

describe RomanNumeralConverter do
  Given(:converter) { RomanNumeralConverter.new }

  Then { converter.convert(1).should == 'I' }
  Then { converter.convert(2).should == 'II' }
  Then { converter.convert(3).should == 'III' }
  Then { converter.convert(4).should == 'IV' }
  Then { converter.convert(5).should == 'V' }
  Then { converter.convert(6).should == 'VI' }
  Then { converter.convert(7).should == 'VII' }
  Then { converter.convert(8).should == 'VIII' }
  Then { converter.convert(9).should == 'IX' }
  Then { converter.convert(10).should == 'X' }
end
