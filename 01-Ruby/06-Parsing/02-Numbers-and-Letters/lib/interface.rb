require_relative 'longest_word'

require 'socket'                # Get sockets from stdlib

server = TCPServer.open(2000)   # Socket to listen on port 2000
loop {                          # Servers run forever
  Thread.start(server.accept) do |client|
    client.puts(Time.now.ctime) # Send the time to the client
  client.puts "Closing the connection. Bye!"
    client.close                # Disconnect from the client
  end
}

puts "******** Welcome to the longest word-game !********"
puts "Here is your grid :"
grid = generate_grid(9)
puts grid.join(" ")
puts "*****************************************************"

puts "What's your best shot ?"
start_time = Time.now
attempt = gets.chomp
end_time = Time.now

puts "******** Now your result ********"

result = run_game(attempt, grid, start_time, end_time)

puts "Your word: #{attempt}"
puts "Time Taken to answer: #{result[:time]}"
puts "Translation: #{result[:translation]}"
puts "Your score: #{result[:score]}"
puts "Message: #{result[:message]}"

puts "*****************************************************"

