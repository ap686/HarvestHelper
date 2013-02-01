# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ScheduleTypeLookup.find_or_create_by_flag("t", { :flag => "t", :name => "Temperature/Humidity Sensor"})
ScheduleTypeLookup.find_or_create_by_flag("l", { :flag => "l", :name => "Light Sensor"})
ScheduleTypeLookup.find_or_create_by_flag("u", { :flag => "u", :name => "Schedule Update Frequency"})