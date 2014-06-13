require 'rspec'
require 'address_book'
require './lib/phone_number'
require './lib/email'
require './lib/address'

describe Phone_number
  describe '#initialize' do
    it 'initializes the phone number and returns the number' do
      test_phone_number = Phone_number.new('1234567890')
      test_phone_number.number.should eq ('1234567890')
  end
end

describe Address
  describe '#initialize' do
    it 'initializes the address' do
      test_address = Address.new('123 Fake St. Portland OR 97209')
      test_address.address.should eq ('123 Fake St. Portland OR 97209')
  end
end

describe Email
  describe '#initialize' do
    it 'initializes the email' do
      test_email = Email.new('blahblahblah@yahoo.com')
      test_email.email.should eq ('blahblahblah@yahoo.com')
  end
end

describe Contact do
  before do
    Contact.clear
  end

  describe '#initialize' do
    it 'initializes the contact with the first and last name - for now' do
      test_contact = Contact.new('John', 'Smith')
      test_contact.should be_an_instance_of Contact
      test_contact.full_name.should eq "John Smith"
    end
  end

  describe '#add_phone_number' do
    it 'adds a phone number object to the phone number array for a contact' do
      test_contact = Contact.new('Peter', 'Griffin')
      test_contact.add_phone_number('1234567890')
      test_contact.phones[0].should be_an_instance_of Phone_number
    end
  end

  describe 'name_and_numbers' do
    it 'returns the contacts full name and all phone numbers for the contact' do
      test_contact = Contact.new('Stewie', 'Griffin')
      test_contact.add_phone_number('555-555-5555')
      test_contact.add_phone_number('666-666-6666')
      test_contact.name_and_numbers.should eq ("Stewie Griffin 555-555-5555 666-666-6666")
    end
  end


  describe '.all' do
    it 'is empty at first' do
      Contact.all.should eq []
    end

    it 'gets added to when save is called on an instance' do
      test_contact = Contact.new('Potato', 'Wilson', )
      test_contact.save
      Contact.all.should eq [test_contact]
    end
  end

  describe '.clear' do
    it 'empties the array of contacts' do
      Contact.new('Corey', 'Norris').save
      Contact.clear
      Contact.all.should eq []
    end
  end

  describe '.create' do
    it 'creates a new instance of Contact' do
      test_contact = Contact.create('Brad','Willis')
      test_contact.should be_an_instance_of Contact
    end

    it 'saves the Contact' do
      test_contact = Contact.create('George', 'Morgan')
      Contact.all.should eq [test_contact]
    end
  end
end
