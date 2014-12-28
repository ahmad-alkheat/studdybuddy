class AddImageStringToUsers < ActiveRecord::Migration
  def change
    add_column :users, :image_string, :string
  end
end
