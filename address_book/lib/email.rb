require 'address_book'

class Email
  @@all_emails = []

  def Email.all
    @@all_emails
  end

  def Email.create(email)
    new_email = Email.new(email)
    new_email.save
    new_email
  end

  def email
    @email
  end

  def initialize(email)
    @email = email
  end

  def save
    @@all_emails << self
  end
end
