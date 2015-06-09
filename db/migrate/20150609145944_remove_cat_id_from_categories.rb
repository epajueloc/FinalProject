class RemoveCatIdFromCategories < ActiveRecord::Migration
  def change
    remove_reference :categories, :category, index: true, foreign_key: true
  end
end
