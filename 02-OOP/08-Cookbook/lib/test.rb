require 'nokogiri'
require 'open-uri'

def nokogiri(search)

  doc = Nokogiri::HTML(open("http://www.marmiton.org/recettes/recherche.aspx?aqt=#{search}"))

  doc.search('.m_search_result').each do |element|
    recipe = ["#{element.search('.m_search_titre_recette > a').inner_text}"]
    recipe << "Average rating : #{element.search('.etoile1').size} / 5"
    recipe << "#{element.search('.m_search_nb_votes').inner_text}"
    timing = /Préparation : (\d+) min Cuisson : (\d+)/.match("#{element.search('.m_search_result_part4').inner_text}")
    recipe << timing[1]
    recipe << timing[2]
  end
end

p nokogiri("framboise")
