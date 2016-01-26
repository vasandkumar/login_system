class CreateBlockings < ActiveRecord::Migration
  def change
    create_table :blockings do |t|
      t.integer :block_category
      t.integer :block_type
      t.integer :blocked_by
      t.string  :block_param
      t.boolean :current_status
      t.text :reason

      t.timestamps null: false
    end
  end
end
