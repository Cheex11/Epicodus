require './lib/phone_number'
require './lib/address'
require './lib/email'


class Contact
  @@all_contacts = []

  def Contact.all
    @@all_contacts
  end

  def Contact.clear
    @@all_contacts = []
  end

  def Contact.create(first, last)
    new_contact = Contact.new(first, last)
    new_contact.save
    new_contact
  end

  def initialize(first, last)
    @phones = []
    @addresses = []
    @emails = []
    @first_name = first
    @last_name = last
    @full_name = first + " " + last
    @first_name + " " + @last_name
  end



  def add_phone_number(number)
    @phones << Phone_number.new(number)
  end

  def add_email(email)
    @emails << Email.new(email)
  end

  def add_address(address)
    @addresses << Address.new(address)
  end

  def full_name
    @full_name
  end

  def phones
    @phones
  end

  def emails
    @emails
  end

  def addresses
    @addresses
  end

  def first_name
    @first_name
  end

  def last_name
    @last_name
  end

  def name_and_numbers
    @full_name + " " + @phones[0].number + " " + @phones[1].number
  end

  # def phone_number
  #   @phone_number
  # end

  # def email
  #   @email
  # end

  # def address
  #   @address
  # end

  def save
    @@all_contacts << self
  end
end
