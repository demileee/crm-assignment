require_relative './contact.rb'

class CRM

  def main_menu
    while true # repeat indefinitely
      print_main_menu
      user_selected = gets.to_i
      call_option(user_selected)
    end
  end

  def print_main_menu
    puts '[1] Add a new contact'
    puts '[2] Modify an existing contact'
    puts '[3] Delete a contact'
    puts '[4] Display all the contacts'
    puts '[5] Search by attribute'
    puts '[6] Exit'
    puts 'Enter a number: '
  end

  def call_option(user_selected)
    case user_selected
    when 1 then add_new_contact
    when 2 then modify_existing_contact
    when 3 then delete_contact
    when 4 then display_all_contacts
    when 5 then search_by_attribute
    when 6 then exit
    # To be clear, the methods add_new_contact and modify_existing_contact
    # haven't been implemented yet
    end
  end

  def add_new_contact
    print 'Enter First Name: '
    first_name = gets.chomp

    print 'Enter Last Name: '
    last_name = gets.chomp

    print 'Enter Email Address: '
    email = gets.chomp

    print 'Enter a Note: '
    note = gets.chomp

    Contact.create(
      first_name: first_name,
      last_name: last_name,
      email: email,
      note: note)
  end

  def modify_existing_contact
    puts "Enter the contact ID to update:"
    id = gets.to_i
    id = Contact.find(id)

    puts "Which attribute would you like to change?"
    puts "Enter 'first_name', 'last_name', 'email', or 'note'"
    att = gets.chomp

    puts "What would you like to change it to?"
    change = gets.chomp
    id.update_attributes(att => change)
  end

  def delete_contact
    puts "Enter the contact ID to update:"
    id = gets.to_i
    id = Contact.find(id)
    id.delete
    puts "Contact has been deleted."
  end

  def display_all_contacts
    puts Contact.all.inspect
  end

  def search_by_attribute
    puts "What would you like to search by?"
    att = gets.chomp

    puts "What is the search term?"
    val = gets.chomp

    puts Contact.find_by(att => val).inspect
  end

end

app = CRM.new
app.main_menu

at_exit do
  ActiveRecord::Base.connection.close
end
