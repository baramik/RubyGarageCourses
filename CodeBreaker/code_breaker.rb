module Validator 
    private
    def valid?(string)
        string =~ /^[1-6]{4}$/ ? true : false
    end
end     

module RandomGenerator
      private
      def random
          random_string = ""
          4.times{random_string << rand(1..6).to_s}
          instance_variable_set "@random_string", random_string
      end 
end   

class Game
  include RandomGenerator
  include Validator
  
  def initialize
      @string = ""
  end

  def new_game
    puts @string << random
     valid?(@string)
  end
  def compare(string1, string2)
    compare_array = []

    result = string1==string2 ? true : false

    if result
        string_size = "#{string1}".size
     	string_size.times{compare_array.push("+")}
     	compare_array
     else
     	puts "Fuck off"
     end
     
      #string1==string2 ? true : false
  end
end  


class Guess
  include Validator
  attr_accessor :input
  def initialize(input)
    @input = input
  end
  
  def validate
    valid?(@input)    
  end  
end 
