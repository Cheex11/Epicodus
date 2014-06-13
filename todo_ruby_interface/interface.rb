require './lib/address_book'

def main_menu

  puts "Press 'c' to add a new contact"
  puts "Press 'l' to list all contacts"

  main_choice = gets.chomp

  if main_choice == 'c'
    add_new_contact
  elsif main_choice == 'l'
    all_contacts
  end

end



def add_new_contact
  puts "HELLO"
    puts "What is the contact's first name?"
    first_name = gets.chomp
    puts "What is the contact's second name?"
    last_name  = gets.chomp
    puts "What is the contact's phone number"
    phone_number = gets.chomp
    puts "What is the contact's email?"
    email = gets.chomp
    puts "What is the contact's State?"
    state = gets.chomp

    new_contact = Contact.create(first_name, last_name, phone_number, email, state)
    main_menu

    puts Contact.all_contacts[-1].full_name has been added to the list
end

  # def all_contacts
  # end



main_menu
