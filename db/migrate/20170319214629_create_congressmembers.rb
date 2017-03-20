class CreateCongressmembers < ActiveRecord::Migration[5.0]
  def change
    create_table :congressmembers do |t|
      t.string :first_name, null: false
      t.string :middle_name
      t.string :last_name, null: false
      t.string :party, null: false
      t.string :leadership_role
      t.string :twitter_account
      t.string :facebook_account
      t.string :email, null: false 
      t.string :url, null: false
      t.string :senority
      t.integer :next_election, null: false
      t.string :phone_number, null: false
      t.string :state, null: false
    end
  end
end
