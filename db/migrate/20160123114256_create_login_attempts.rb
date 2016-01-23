class CreateLoginAttempts < ActiveRecord::Migration
  def change
    create_table :login_attempts do |t|
      t.integer :user_id
      t.string :ip_address
      t.string :country_name
      t.string :city_name
      t.string :real_region_name
      t.boolean :success

      t.timestamps null: false
    end
  end
end
