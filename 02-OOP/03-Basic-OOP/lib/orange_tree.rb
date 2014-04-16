class OrangeTree

  # TODO: Implement all the specs defined in the README.md :)
  attr_reader :height
  attr_accessor :fruits_count, :fruits

  def initialize
    @height = 0
    @age = 0
    @picks = 0
  end


  def one_year_passes!
    @age += 1
    @height += 1 if @age <= 10
    @picks = 0
  end


  def dead?
    if @age <= 50
      false
    elsif @age < 100
      rand(@age) < 50 ? false : true
    else
      true
    end
  end

  def fruits
    if @age <= 5 || @age > 15
      @fruits_count = 0
    elsif @age < 11
      @fruits_count = 100 - @picks
    elsif @age <= 15
      @fruits_count = 200 - @picks
    end
  end

  def pick_a_fruit!
    @picks += 1
  end

end

# - You should be able to measure the tree
# - Each year, the tree should age (it becomes older and taller, and eventually dies).
# - A tree grows 1 meter per year until 10 years old. Then it stops.
# - Before 50 years old, the proabability of dying as a year pass is zero.
# - After 50 years old, the probability of dying increases
# - No tree can live more than 100 years
# - A tree will produce 100 fruits a year once it is 5 years old
# - A tree will produce 200 fruits a year between 10 and 15 years old
# - A tree will not produce any fruits after that
# - You should be able to pick an fruit from the tree
# - You should be able to count how many fruits on the tree there are left
# - Every year, fruits which were not picked just fall off
