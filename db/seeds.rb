# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# ----------------------------------------------------

# Created a Contact
c = Contact.create(email: "johndoe@example.com", name_first: "John", name_last: "Doe", twitter: "johndoe")
# Created a PhoneNumber
p = PhoneNumber.create(name: "John Doe", phone_number: "1234567890")
# Created the relationship between the above Contact and PhoneNumber
c.phone_numbers << p
