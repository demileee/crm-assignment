require_relative './contact.rb'

class CRM

  at_exit do
    ActiveRecord::Base.connection.close
  end

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

  def call_option
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

  def enter_id
    puts "Enter your ID number:"
    id = gets.chomp.to_i
    @current = Contact.find(id)
    return @current
  end

  def which_attribute
    puts "Enter 1 for first name"
    puts "Enter 2 for last name"
    puts "Enter 3 for email"
    puts "Enter 4 for notes"
    attribute = gets.chomp.to_i
      attribute = "first_name" if attribute == 1
      attribute = "last_name" if attribute == 2
      attribute = "email" if attribute == 3
      attribute = "notes" if attribute == 4
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

    Contact.create(first_name, last_name, email, note)
  end

  def modify_existing_contact(id)
    enter_id
    puts "What would you like to change?"
    which_attribute
    puts "What would you like to change it to?"
    change = gets.chomp
    @contact.update(attribute, change)
  end

  def delete_contact
    enter_id
    @contact.delete
    "Contact has been deleted."
  end

  def display_all_contacts
    return Contact.all
  end

  def search_by_attribute
    puts "What would you like to search by?"
    which_attribute
    puts "What is the value of that attribute?"
    value = gets.chomp
    Contact.find_by(attribute, value)
  end


end
