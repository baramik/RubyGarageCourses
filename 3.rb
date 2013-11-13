
#Describe the mail sorting (city, street, house, apartment, destination, value). Write a program that determines:

#  the number of parcels sent to some city
#  how many parcels with value higher than 10 were sent
#  what is the most popular address

class Mail_Sorting
  @@mails = []

  attr_reader :city, :street, :house, :apartment, :destination, :value
  
  def initialize(city, street, house, apartment, destination, value)
    @city, @street, @house, @apartment, @destination, @value = city, street, house, apartment, destination, value
    @@mails << self
  end

  def self.find_parsels_count_city(city)
    count = 0
    
    @@mails.each do |mail|
      count +=1 if mail.city = city
    end

    count
  end

  def self.find_parsels_count_value
    count = 0
    
    @@mails.each do |mail|
      count +=1 if mail.value > 10
    end

    count
  end

  def self.find_popular_adress
    mails = Hash.new(0)

    @@mails.each do |mail|
      mails[ [mail.city, mail.street, mail.house, mail.apartment].join(', ') ] += 1
    end

    mails.sort_by { |adress, count| count }.reverse.first.first
  end
end

