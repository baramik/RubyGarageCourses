#In library each book order includes information about reader: name, order date, issue date. Write program that determines:

 #   the smallest period for which library found a book
  #  how many orders were not satisfied
   # who often takes the book
    #what is the most popular book
    #how many people ordered one of the three most popular books.
class BookLibrary
	
	@@orders = []
	attr_accessor :name, :order_date, :issue_date, :reader
	def initialize(name, order_date, issue_date, reader)
		@name = name
		@order_date = order_date
		@issue_date = issue_date
		@reader = reader
		@@orders.push(self)

	end	
	
	def self.smallest_period
		period = []
		 @@orders.each {|order| period << order.order_date - order.issue_date}
		puts period.min 
	end	

	def self.unsatisfied_orders
		unsatisfied_count = 0 
		@@orders.each {|order| unsatisfied_count +=1 if order.issue_date == nil}
		puts unsatisfied_count
	end
	
	def self.most_popular_book
	    books = Hash.new(0)
	    @@orders.each {|order| books[order.name] +=1}
		max_books = books.values.max
		books.select{|key,value| puts "The name of most popular book is '#{key}'" if value==max_books}
	end
	
	def self.most_popular_reader
		readers = Hash.new(0)
		@@orders.each {|order| readers[order.reader] +=1}
		max_reader = readers.values.max
		readers.select{|key,value| puts "The name of most popular reader is '#{key}'" if value==max_reader}
	end	

	def self.find_count_people
    	 books = Hash.new(0)

    @@orders.each do |order|
      books[order.name] += 1
    end

    top_3 = books.sort_by { |book, count| count }.reverse.first(3)
    top_3_book_name = top_3[rand(3)].first

    count = 0
    @@orders.each do |order|
      count += 1 if order.name == top_3_book_name
    end

    puts count
  end
 
end	


