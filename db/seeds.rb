# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Category.delete_all

Category.create! type: 'Gardener'
Category.create! type: 'Plumber'
Category.create! type: 'Electrician'
Category.create! type: 'Mechanic'
Category.create! type: 'Repairman'
Category.create! type: 'Cleaner'
Category.create! type: 'Painter'
Category.create! type: 'Carpenter'
Category.create! type: 'Hairdreser'
Category.create! type: 'Make-up Artist'
Category.create! type: 'Stylist'
Category.create! type: 'Photographer'
Category.create! type: 'Chef/Caterer'
Category.create! type: 'Personal Trainer'
Category.create! type: 'Technology Specialist'
Category.create! type: 'Physical Labourer'
Category.create! type: 'Other'

