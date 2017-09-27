class Contact
  @@all = []
  @@id = 1

  # This method should initialize the contact's attributes
  def initialize(first_name, last_name, email, note = "N/A")
    @first_name = first_name
    @last_name = last_name
    @email = email
    @username = username
    @note = note
    @id = @@id
    @@id += 1
  end

  def first_name
    return @first_name
  end

  def first_name=(first_name)
    @first_name = first_name
  end

  def last_name
    return @last_name
  end

  def last_name=(last_name)
    @last_name = last_name
  end

  def email
    return @email
  end

  def email=(email)
    @email = email
  end

  def note
    return @note
  end

  def note=(note)
    @note = note
  end

  def id
    return @id
  end

  # This method should call the initializer,
  # store the newly created contact, and then return it
  def self.create(first_name, last_name, email, note="N/A")
    @contact = Contact.new(first_name, last_name, email, note="N/A")
    @@all << @contact
    return @contact
  end

  # This method should return all of the existing contacts
  def self.all
    return @@all
  end

  # This method should accept an id as an argument
  # and return the contact who has that id
  def self.find(id)
    @@all.each do |contact|
      if contact.id == id
        return contact
      end
    end
  end

  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
  def update(id, attribute, change)
    @@all.each do |contact|
      if contact.id == id
        contact.attribute = change
      end
    end
  end

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  def self.find_by(attribute, value)
    @@all.each do |contact|
      if contact.attribute == value
        return contact
      end
    end
  end

  # This method should delete all of the contacts
  def self.delete_all
    @@all = []
    return @@all
  end

  def full_name
    puts "#{@first_name} #{@last_name}"
  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def delete
    return @@all.delete(self)
  end

  # Feel free to add other methods here, if you need them.

end
