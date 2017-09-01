require './mastermind.rb'

def get_name
  puts "What is your name?"
  name = gets.chomp
  name
end

puts "Welcome to Mastermind!"
puts "Lets begin"
puts "Would you like to be the creator or the breaker?"
puts "Put c for creator, b for breaker: "
choice = gets.chomp.downcase
while !choice.match(/[cb]/)
  puts "Incorrect input, enter c or b"
  choice = gets.chomp.downcase
end
mastermind = Mastermind.new
choice == "b" ? mastermind.user_is_breaker(get_name) : mastermind.user_is_creator(get_name)
