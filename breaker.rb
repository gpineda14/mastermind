class Breaker
  attr_accessor :name, :guess
  def initialize(name="Computer")
    @name = name
    @guess = []
  end

  def make_guess(options)
    index = 1
    while @guess.size < 4
      puts "Type in a color ##{index}: "
      color = gets.chomp.downcase
      while !options.include?(color)
        puts "Incorrect choice, pick a color from the list"
        color = gets.chomp.downcase
      end
      @guess << color
      index += 1
    end
  end

  def generate_guess(options)
    4.times {
      @guess << options.sample
    }
  end

  def reset_guess
    @guess = []
  end

end
