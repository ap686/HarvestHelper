# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

AdminUser.find_or_create_by_email(:email => 'admin@example.com', :password => 'password', :password_confirmation => 'password')
MessageBoard.find_or_create_by_name("Sample Message Board") 

ScheduleTypeLookup.find_or_create_by_flag(:flag => "t", :name => "Temperature/Humidity Sensor")
ScheduleTypeLookup.find_or_create_by_flag(:flag => "l", :name => "Light Sensor")
ScheduleTypeLookup.find_or_create_by_flag(:flag => "u", :name => "Schedule Update Frequency")