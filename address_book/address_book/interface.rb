require './lib/address_book'

def main_menu

  puts "Press 'c' to add a new contact"
  puts "Press 'e' to edit and add contact information"
  puts "Press 'l' to list all contacts"
  puts "Press 'x' to exit"
  puts "Press 'v' to view a particular contact"

  main_choice = gets.chomp

  if main_choice == 'c'
    add_new_contact
  elsif main_choice == 'l'
    all_contacts
  elsif main_choice == 'e'
    edit_contacts
  elsif main_choice == 'v'
    view_contact
  elsif main_choice == 'x'
    "Goodbye"
  else
    puts "Please enter a valid option"
    main_menu
  end

end


def edit_contacts
  puts "Here are your contacts:"
  counter = 1
  Contact.all.each do |contact|
    puts "#{counter})" + contact.full_name
    counter += 1
  end
  puts "What contact would you like to edit?"
  selected = gets.chomp.to_i
  contact = Contact.all[selected-1]
  puts "What would you like to do with the contact?"
  puts "Press 'e' to add an e-mail"
  puts "Press 'p' to add a phone number"
  puts "Press 'a' to add an address"
  puts "Press 'm' to return to the main menu"
  edit_choice = gets.chomp

  if edit_choice == 'p'
    puts "What is the new phone number for #{Contact.all[selected-1].full_name}?"
    new_number = gets.chomp.to_i
    Contact.all[selected-1].add_phone_number(new_number)
    puts "#{Contact.all[selected-1].phones[-1].number} has been addded"
    main_menu
  elsif edit_choice == 'e'
    puts "What is the new email for #{Contact.all[selected-1].full_name}?"
    new_email = gets.chomp
    Contact.all[selected-1].add_email(new_email)
    puts "#{Contact.all[selected-1].emails[-1].email} has been addded"
    main_menu
  elsif edit_choice == 'a'
    puts "What is the new address for #{Contact.all[selected-1].full_name}?"
    new_address = gets.chomp
    Contact.all[selected-1].add_address(new_address)
    puts "#{Contact.all[selected-1].addresses[-1].address} has been addded"
    main_menu
  end


end


def add_new_contact
    puts "What is the contact's first name?"
    first_name = gets.chomp
    puts "What is the contact's last name?"
    last_name  = gets.chomp
    new_contact = Contact.create(first_name, last_name)
    puts Contact.all[-1].full_name +  " has been added to the list"
    main_menu
end

def all_contacts
  puts "Here are your current contacts"
  counter = 1
  Contact.all.each do |contact|
    puts "#{counter})" + contact.full_name
    counter += 1
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



















