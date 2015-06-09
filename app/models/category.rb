class Category < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_and_belongs_to_many :postings

  self.inheritance_column = 'sti_type'
end
