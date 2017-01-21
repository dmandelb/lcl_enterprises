# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
flash = Consignee.create(name: "Central City Imports", phone: "718-555-4242", email: "barry_allen@centralcity.com", password: "password")
greenlantern = Consignee.create(name: "Highball Imports", phone: "650-555-1234", email: "hal_jordan@highball.com", password: "password")

monty_hall = Container.create(container_number: "GLFU2814428")

lcl_car = Lcl.create(consignee_id: greenlantern.id, description: "Fancy car", destination_name: "Port of Oakland", dest_lat: 37.779237, dest_long: -122.254877)
lcl_first_goat = Lcl.create(consignee_id: flash.id, description: "Hand-carved goat statue", destination_name: "Port of Oakland", dest_lat: 37.779237, dest_long: -122.254877)
lcl_second_goat = Lcl.create(consignee_id: flash.id, description: "Hand-carved Charlie Brown statue", destination_name: "Port of Oakland", dest_lat: 37.779237, dest_long: -122.254877)

# "135.84.167.194:3000/lcls/register"
# rails server -b 135.84.167.194 -p 3000
