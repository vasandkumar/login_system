class UserRole < ActiveRecord::Base

  belongs_to :user
  belongs_to :role
  belongs_to :assigner, :class_name => 'User', :foreign_key => 'assigned_by'

end
