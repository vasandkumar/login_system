class Blocking < ActiveRecord::Base

  belongs_to :blocker, :class_name => 'User', :foreign_key => 'blocked_by'
  CATEGORY_USER = 1
  CATEGORY_IP_ADDRESS = 2
end
