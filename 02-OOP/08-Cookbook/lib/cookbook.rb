require 'csv'
require 'open-uri'
require 'nokogiri'

class CookBook

  attr_reader :data

  def initialize(file)
    load_csv(file)
  end

  def import(search)

    doc = Nokogiri::HTML(open("http://www.marmiton.org/recettes/recherche.aspx?aqt=#{search}"))

    doc.search('.m_search_result').each do |element|
      recipe = ["#{element.search('.m_search_titre_recette > a').inner_text}"]
      recipe << "#{element.search('.etoile1').size} / 5"
      recipe << "#{element.search('.m_search_nb_votes').inner_text}"
      timing = /Préparation : (\d+) min Cuisson : (\d+)/.match("#{element.search('.m_search_result_part4').inner_text}")
      recipe << timing[1]
      recipe << timing[2]
      @data << recipe
    end
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


