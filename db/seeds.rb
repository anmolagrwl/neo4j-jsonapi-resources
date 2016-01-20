# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Contact.create(email: "anmol1771@gmail.com", name_first: "Anmol", name_last: "Agrawal", twitter: "anmol1771")
c = Contact.create(email: "johndoe@example.com", name_first: "John", name_last: "Doe", twitter: "johndoe")
p = PhoneNumber.create(name: "John Doe", phone_number: "1234567890")
c.phone_numbers << p
