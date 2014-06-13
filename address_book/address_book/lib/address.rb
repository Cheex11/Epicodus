require './lib/address_book'

class Address
  @@all_addresses = []

  def Address.all
    @@all_addresses
  end

  def Address.create(address)
    new_address = Address.new(address)
    new_address.save
    new_address
  end

  def address
    @address
  end

  def initialize(address)
    @address = address
  end

  def save
    @@all_address << self
  end
end
