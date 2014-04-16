class WagonTeacher

  def initialize(name, hair, love_ruby=true)
    @name = name
    @hair = hair
  end

  def mood(time)
    case time
    when 9
      "sleepy"
    when 13
      "hungry"
    when 19
      "tired"
    else
      "nice"
    end
  end

end

WagonTeacher.new("Sébastien", "short dark")
WagonTeacher.new("Gabriel", "long")
WagonTeacher.new("Boris", "curly")
WagonTeacher.new("Olivier", "short brown")

