module Controler

  def self.is_victory?(guess,code)
    true if guess == code
  end

  def self.num_of_same_colors(guess,code)
    return 4 - (code - guess).length
  end

  def self.num_of_hits(guess,code)
    hits = 0
    for i in 0..3
      hits +=1 if guess[i] == code[i]
    end
    return hits
  end
end
