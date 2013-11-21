class Module
  def set_attribute(arg_name_setter, default_value = nil, &block)
    define_method ("#{arg_name_setter}") { #Дефайним метод и задаём ему имя для 
      unless instance_variable_defined?("@#{arg_name_setter}")
        #если блок не был передан выставляем дефолтное значение инстанс переменной 
        #Если был передан блок выставляем результата блока  
      (block_given?) ? instance_variable_set("@#{arg_name_setter}", instance_eval(&block)) : instance_variable_set("@#{arg_name_setter}",default_value)
      end
      
      instance_variable_get("@#{arg_name_setter}") }#геттер для инстанс переменной
    
    #дефайним методы =/?
    define_method ("#{arg_name_setter}=") {|value| instance_variable_set("@#{arg_name_setter}", value)}
    
    define_method ("#{arg_name_setter}?") {!instance_variable_get("@#{arg_name_setter}").nil?}
    
  end
    
     #Далаем проверку на хеш 
     def attribute(*args, &block)
        args.first.kind_of?(Hash) ? args.first.each {|key, value| set_attribute(key, value)} : set_attribute(*args, &block )
     end
  
end
