require 'open-uri'
require 'json'

def json_object(attempt)
  solution = attempt
  data = JSON.parse(open("http://api.wordreference.com/80143/json/enfr/#{solution}").read)
  result = {}
  result[:translation] = data["term0"]["PrincipalTranslations"]["0"]["FirstTranslation"]["term"]
  p result[:translation]
end

json_object("lift")

