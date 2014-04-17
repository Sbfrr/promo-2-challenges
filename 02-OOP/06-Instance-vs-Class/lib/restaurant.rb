class Restaurant

  #TODO add relevant accessors if necessary
  attr_reader :average_rating, :city, :name

  def initialize(city, name)
    #TODO: implement constructor with relevant instance variables
    @name = name
    @city = city
    @average_rating = "No visitor yet"
    @ratings = []
  end

  def rate(new_rating)
    @ratings << new_rating
    @average_rating = @ratings.inject(:+)/@ratings.length
  end

  def self.filter_by_city(arg=[], city)
    result = []
    result << arg.pop {|resto| resto if resto.city == city}
  end

  #TODO: implement #filter_by_city and #rate methods

end

