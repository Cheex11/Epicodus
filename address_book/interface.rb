require './lib/address_book'

def main_menu

  puts "Press 'c' to add a new contact"
  puts "Press 'l' to list all contacts"
  puts "Press 'x' to exit"
  puts "Press 'v' to view a particular contact"

  main_choice = gets.chomp

  if main_choice == 'c'
    add_new_contact
  elsif main_choice == 'l'
    all_contacts
  elsif main_choice == 'v'
    view_contact
  elsif main_choice == 'x'
    "Goodbye"
  else
    puts "Please enter a valid option"
    main_menu
  end

end



def add_new_contact
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
    puts Contact.all[-1].full_name +  " has been added to the list"
    main_menu
end

def all_contacts
  puts "Here are your current contacts"
  Contact.all.each do |contact|
    puts contact.full_name
  end
  main_menu
end

def view_contact
  puts "Which contact would you like to view?"
  counter = 1
  Contact.all.each do |contact|
    puts "#{counter})" + contact.full_name
    counter += 1
  end

  to_show = gets.chomp.to_i
  contact = Contact.all[to_show-1]
  puts contact.first_name + " " + contact.last_name + " " + contact.phone_number + " " + contact.email + " " + contact.state
end

main_menu



















