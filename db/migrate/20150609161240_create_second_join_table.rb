class CreateSecondJoinTable < ActiveRecord::Migration
  def change
    create_join_table :categories, :postings do |t|
      # t.index [:category_id, :posting_id]
      # t.index [:posting_id, :category_id]
    end
  end
end
