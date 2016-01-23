class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :role_name
      t.integer :created_by

      t.timestamps null: false
    end
  end
end
