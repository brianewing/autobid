# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

raw_cars = CSV.read File.join(File.dirname(__FILE__), 'seeds', 'cars.csv')
makes = raw_cars.shift
models = []

raw_cars.each do |row|
  row.each_with_index do |model, i|
    models[i] ||= []
    models[i].push(model) if model
  end
end

cars = Hash[*makes.zip(models).flatten(1)]
cars.each_pair do |make, models|
  make = Manufacturer.create(:name => make)
  
  models.each do |model|
    Model.create(:name => model, :manufacturer => make)
  end
end