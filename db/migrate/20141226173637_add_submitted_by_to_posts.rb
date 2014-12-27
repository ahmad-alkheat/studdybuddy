class AddSubmittedByToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :submitted_by, :string
  end
end
