
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
      when 1 then "red"
      when 2 then "green"
      when 3 then "blue"
      when 4 then "yellow"
      when 5 then "black"
      when 6 then "white"
      when 7 then "brown"
      when 8 then "orange"
    end
  end
end
