class Dessert

  attr_accessor :name, :calories

  def initialize(name, calories)
    @calories = calories
    @name = name
  end

  def healthy?
    @calories < 200 ? true : false
  end

  def delicious?
    true
  end
end

class JellyBean < Dessert

  attr_reader :flavor

  def initialize(name, calories, flavor)
    super(name, calories)
    @flavor = flavor
  end

  def delicious?
    @flavor == "black licorice" ? false : true
  end

end