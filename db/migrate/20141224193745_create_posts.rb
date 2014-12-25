class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :course_name
      t.integer :course_number

      t.timestamps null: false
    end
  end
end
