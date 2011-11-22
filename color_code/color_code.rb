class ColorCode
  attr_writer :secret, :lockout_limit

  def initialize
    @lockout_limit = 1 unless @lockout_limit
  end

  def evaluate_colors(*colors)
    puts colors.inspect
    @attempts = @attempts.to_i.succ
    return "omg caught" if @attempts == @lockout_limit 

    result = {:color => 0, :place => 0}
    
    colors.each_with_index do |color, i|
      if @secret[i] == color
        result[:place] = result[:place].succ
      elsif @secret.include?(color)
        result[:color] = result[:color].succ       
      end

      if result[:place] == 4
        return 'code cracked!'
      end

    end

    result
  end
end
