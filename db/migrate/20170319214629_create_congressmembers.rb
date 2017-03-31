class CreateCongressmembers < ActiveRecord::Migration[5.0]
  def change
    create_table :congressmembers do |t|
      t.string :full_name, null: false
      t.string :party, null: false
      t.string :chamber, null: false
      t.string :leadership_role
      t.string :twitter_account
      t.string :facebook_account
      t.string :email
      t.string :url
      t.string :senority
      t.integer :next_election, null: false
      t.string :phone
      t.string :state, null: false
    end
  end
end
