class CreateCongresslists < ActiveRecord::Migration[5.0]
  def change
    create_table :congresslists do |t|
      t.belongs_to :list
      t.belongs_to :congressmember
    end
  end
end
