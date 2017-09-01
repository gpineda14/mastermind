class Creator
  attr_accessor :name, :code, :result
  def initialize(name="Computer")
    @name = name
    @code = []
    @result = {"Correct": 0, "Correct color": 0}
  end

  def generate_code(options)
    4.times {
      @code << options.sample
    }
  end

  def pick_code(options)
    index = 1
    while @code.size < 4
      puts "Type in color ##{index}: "
      color = gets.chomp.downcase
      while !options.include?(color)
        puts "Incorrect choice, pick a color from the list"
        color = gets.chomp.downcase
      end
      @code << color
      index += 1
    end
  end

  def provide_feedback(master, attempt)
    index = 0
    values = []
    while index < master.size
      if master[index] == attempt[index]
        values << attempt[index]
        @result[:Correct] += 1
      end
      index += 1
    end
    attempt.each do |color|
      @result[:"Correct color"] += 1 if !values.include?(color) && master.include?(color)
    end
    @result[:"Correct color"]
    @result.each {|key, value| puts "#{key}: #{value}"}
  end

  def reset_results
    @result.each {|key, value| @result[key] = 0}
  end

end
