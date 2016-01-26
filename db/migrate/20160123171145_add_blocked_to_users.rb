class AddBlockedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :blocked, :boolean
    add_column :users, :blocked_at, :datetime
  end
end
