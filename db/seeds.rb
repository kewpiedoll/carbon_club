# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = Producer.create( user_name: 'Chris',
												full_name:  'Chris A',
												init_kwh_reading: 1890,
												email: 'abc@1234.org')

energy_profile = EnergySystem.create(title: 'PV Solar', 
																			CO2_rating: 46)

