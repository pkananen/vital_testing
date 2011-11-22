require 'rspec/given'
require_relative 'color_code'

# Red, Orange, Yellow, Green, Blue, Violet, Pink, or purple

describe ColorCode do
  Given (:code_breaker) do
    code_breaker = ColorCode.new 
    code_breaker.secret = [:orange, :blue, :violet, :yellow]
    code_breaker
  end

  describe "#evaluate_colors" do
    describe "getting caught" do
      context "auto limit" do
        Then { code_breaker.evaluate_colors(:red).should == "omg caught" }
      end
      context "setting limit" do
        Given { code_breaker.lockout_limit = 5 }
        When do 
          4.times { code_breaker.evaluate_colors(:red, :red, :red, :red) }
        end
        Then { code_breaker.evaluate_colors(:red, :red, :red, :red).should == "omg caught" }
      end
    end
    describe "matching colors" do
      Given { code_breaker.lockout_limit = 2 }
      context "all different colors" do
        When (:result) { code_breaker.evaluate_colors(:red, :pink, :purple, :green) }
        Then { result[:color].should == 0 }
        Then { result[:place].should == 0 }
      end
      context "all right colors, no right positions" do
        When (:result) { code_breaker.evaluate_colors(:yellow, :violet, :orange, :blue) }
        Then { result[:color].should == 4 }
        Then { result[:place].should == 0 }
      end
      context "all right colors, one right position" do
        When (:result) { code_breaker.evaluate_colors(:violet, :orange, :blue, :yellow) }
        Then { result[:color].should == 3 }
        Then { result[:place].should == 1 }
      end
      context "all right colors, two right positions" do
        When (:result) { code_breaker.evaluate_colors(:violet, :blue, :orange, :yellow) }
        Then { result[:color].should == 2 }
        Then { result[:place].should == 2 }
      end
      context "all right colors, all right positions" do
        When (:result) { code_breaker.evaluate_colors(:orange, :blue, :violet, :yellow) }
        Then { result.should == 'code cracked!' }
      end
    end
  end
end
