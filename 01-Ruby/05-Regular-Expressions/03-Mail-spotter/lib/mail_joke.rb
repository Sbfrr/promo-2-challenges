# Encoding: utf-8
require 'pry'

def mail_joke(email)

  raise ArgumentError, 'Argument is not an email' if email.match(/@/) == nil


  adress = email.match(/(?<name>\w*)\.?+(?<last_name>\w*)@(?<domain>\w*)/)

  case adress[:domain]
  when "lewagon"
    "Well done #{adress[:name]}, you're skilled and capable"
  when "gmail"
    "#{adress[:name]}, you're an average but modern person"
  when "live"
    "jean-#{adress[:name]} #{adress[:last_name]}, aren't you born before 1973?"
  else
    "Sorry #{adress[:name]}, we don't know how to judge '#{adress[:domain]}.gal'"
  end




end

puts mail_joke("seb@lewagon")