# require 'phone_number'
# require 'address'
# require 'email'


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
    @address = []
    @emails = []
    @first_name = first
    @last_name = last
    @full_name = first + " " + last
    @first_name + " " + @last_name
  end

  def phones
    @phones
  end

  def add_phone_number(number)
    @phones << Phone_number.new(number)
  end

  def add_email(email)
    @emails << Email.new(email)
  end

  def add_address(address)
    @address << Address.new(address)
  end

  def full_name
    @full_name
  end

  def email
    @email
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
