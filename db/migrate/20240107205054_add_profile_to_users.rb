class AddProfileToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :profile, :text
    add_column :users, :dice_point, :integer
  end
end
