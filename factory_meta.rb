Factory = Class.new do 
  def self.new *args,&block
    Class.new do 
      args.each_with_index do |argument, arg_key|
        @arg_key = arg_key
        attr_accessor :"#{argument}"

      end
      if block_given?
      class_eval &block
      end

      define_method :initialize do |*value_of_arg|
          value_of_arg.each_with_index do |value, index|
              args.each_with_index do |argument, arg_key|
              if arg_key == index
              instance_variable_set :"@#{argument}", value
              end  
                   
            end
          end 
      end      
    end  
  end
end  
puts A = Factory.new(:a, :b, :c)
puts b = A.new(1, 2, 1241251253)
puts b.c
