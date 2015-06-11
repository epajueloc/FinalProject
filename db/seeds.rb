# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Category.delete_all

Category.create! type: 'Gardener', icon: 'leaf'
Category.create! type: 'Plumber', icon: 'wrench'
Category.create! type: 'Electrician', icon: 'lightbulb-o'
Category.create! type: 'Mechanic', icon: 'car'
Category.create! type: 'Repairman', icon: 'gear'
Category.create! type: 'Cleaner', icon: 'home'
Category.create! type: 'Painter', icon: 'picture-o'
Category.create! type: 'Carpenter', icon: 'gavel'
Category.create! type: 'Hairdreser', icon: 'scissors'
Category.create! type: 'Make-up Artist', icon: 'eye'
Category.create! type: 'Photographer', icon: 'camera'
Category.create! type: 'Chef/Caterer', icon: 'cutlery'
Category.create! type: 'Personal Trainer', icon: 'life-ring'
Category.create! type: 'Technology Specialist', icon: 'laptop'
Category.create! type: 'Physical Labourer', icon: 'thumbs-up'
Category.create! type: 'Other', icon: 'globe'

