require 'address_book'

class Phone_number
  @@all_numbers = []

  def Phone_number.all
    @@all_numbers
  end

  def Phone_number.create(number)
    new_number = Phone_number.new(number)
    new_number.save
    new_number
  end

  def number
    @number
  end

  def initialize(number)
    @number = number
  end

  def save
    @@all_numbers << self
  end
end
