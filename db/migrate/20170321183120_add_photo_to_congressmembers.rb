class AddPhotoToCongressmembers < ActiveRecord::Migration
  def up
    add_column :congressmembers, :photo, :string
  end

  def down
    remove_column :congressmembers, :photo
  end
end
