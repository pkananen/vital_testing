require "rspec/given"
require "./bowling_scorer"

describe BowlingScorer do

  Given (:game) { BowlingScorer.new }

  describe "a new game" do
    Then { game.score.should == 0 }

    describe "a game of gutter balls" do
      When { 20.times { game.roll(0) } }
      Then { game.score.should == 0 }
    end

    describe "a game of ones" do
      When { 20.times { game.roll(1) } }
      Then { game.score.should == 20 }
      
      describe "one more roll" do
        When { game.roll(1) }
        Then { game.score.should == 20 }
      end
    end

    describe "a game of ones with one spare in the middle" do
      When do
        8.times { game.roll(1) }
        game.roll(5)
        game.roll(5)
        10.times { game.roll(1) }
      end
      Then { game.score.should == 29 }
    end

    describe "a game of strikes" do
      When { 12.times { game.roll(10) } }
      Then { game.score.should == 300 }
    end
    
    describe "a game of fours" do
      When { 20.times { game.roll(4) } }
      Then { game.score.should be(80) }
    end

  end
  
end
