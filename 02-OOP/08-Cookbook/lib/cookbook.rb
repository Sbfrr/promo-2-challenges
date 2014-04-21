require 'csv'

class CookBook

  attr_reader :data

  def initialize(file)
    load_csv(file)
  end

  def list
    @data
  end

  def add(recipe)
    @data << [recipe]
  end

  def del(recipe)
    @data.map!{|r| r[0] == recipe ? nil : r }.compact!
    @data
  end

  def load_csv(file)
    @data = []
    CSV.foreach(file) {|row| @data << row}
  end

  def save_to_csv(path)
    CSV.open(path, "wb") do |csv|
      @data.each {|recipe| csv << recipe}
    end
  end

end


