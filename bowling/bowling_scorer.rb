class BowlingScorer

  def initialize
    @rolls = []
  end

  def roll(number_of_pins)
    if @rolls.size < 22
      @rolls << number_of_pins
    end
  end

  def score
    score = 0
    return score if @rolls.size == 0
    roll_index = 0
    (0..9).each do
      if isStrike? roll_index
        score += 10 + strikeBonus(roll_index)
        roll_index += 1
      elsif isSpare? roll_index
        score += 10 + spareBonus(roll_index)
        roll_index += 2
      else
        score += scoreFrame(roll_index)
        roll_index += 2
      end 
    end
    score
  end

  def isStrike?(roll_index)
    @rolls[roll_index] == 10
  end

  def isSpare?(roll_index)
    scoreFrame(roll_index) == 10
  end

  def strikeBonus(roll_index)
    @rolls[roll_index + 1] + @rolls[roll_index + 2]
  end

  def spareBonus(roll_index)
    @rolls[roll_index + 2]
  end

  def scoreFrame(roll_index)
    @rolls[roll_index] + @rolls[roll_index + 1]
  end

end
