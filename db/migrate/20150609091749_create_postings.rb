class CreatePostings < ActiveRecord::Migration
  def change
    create_table :postings do |t|
      t.string :title
      t.text :description
      t.datetime :date
      t.string :compensation
      t.string :phone
      t.string :email

      t.timestamps null: false
    end
  end
end
