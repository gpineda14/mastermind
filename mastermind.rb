class Mastermind
  require './creator.rb'
  require './breaker.rb'
  attr_accessor :moves, :options
  def initialize
    @moves = 12
    @options = ["blue", "green", "orange", "yellow", "red", "white"]
    @breaker
    @creator
  end

  def prompt
    puts "Guess the code, pick 4 colors from the following options"
    @options.each_with_index { |value, index| puts "#{index + 1}. #{value}"}
  end

  def user_is_creator(name)
    @creator = Creator.new(name)
    @breaker = Breaker.new
    puts "#{@creator.name}, enter your secret code: "
    @creator.pick_code(@options)
    @breaker.generate_guess(@options)
    @moves -= 1
    puts "#{@breaker.name}'s guess was #{@breaker.guess}"
    until @creator.result[:Correct] == 4 || @moves == 0
      puts "Incorrect"
      puts @creator.code
      puts @breaker.guess
      @creator.reset_results
      @breaker.reset_guess
      @breaker.generate_guess(@options)
      @moves -= 1
      @creator.provide_feedback(@creator.code, @breaker.guess)
    end
    end_game
  end

  def user_is_breaker(name)
    @breaker = Breaker.new(name)
    @creator = Creator.new
    @creator.generate_code(@options)
    prompt
    @breaker.make_guess(@options)
    @moves -= 1
    @creator.provide_feedback(@creator.code, @breaker.guess)
    puts "Your guess is #{@breaker.guess}"
    until @creator.result[:Correct] == 4 || @moves == 0
      puts "Incorrect"
      puts @creator.code
      puts @breaker.guess
      @creator.reset_results
      prompt
      @breaker.reset_guess
      @breaker.make_guess(@options)
      @moves -= 1
      @creator.provide_feedback(@creator.code, @breaker.guess)
    end
    end_game
  end

  def end_game
    puts @breaker.guess == @creator.code ? "Code is cracked! #{@breaker.name} wins!" : "Code not cracked! #{@creator.name} wins!"
  end

end
