class AddUidToPostings < ActiveRecord::Migration
  def change
    add_reference :postings, :user, index: true, foreign_key: true
  end
end
