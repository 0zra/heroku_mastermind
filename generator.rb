
module Library
  public
  def self.generate_code
    code = []
    while code.length != 4
      color = Library.new_color(code)
      code << color
    end
    code
  end

  def self.new_color(code)
    color = Library.converter(rand(8)+1)
    while code.include?(color)
      color = Library.converter(rand(8)+1)
    end
    color
  end

  def self.converter int
    case int
      when 1 then "Red"
      when 2 then "Green"
      when 3 then "Blue"
      when 4 then "Yellow"
      when 5 then "Black"
      when 6 then "White"
      when 7 then "Brown"
      when 8 then "Orange"
    end
  end
end
