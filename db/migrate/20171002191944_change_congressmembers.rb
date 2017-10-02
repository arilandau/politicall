class ChangeCongressmembers < ActiveRecord::Migration[5.0]
  def up
    change_column_null :congressmembers, :next_election, false
  end

  def down
    change_column_null :congressmembers, :next_election, true
  end
end
