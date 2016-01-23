class LoginAttempt < ActiveRecord::Base

  belongs_to :user

  UNKNOWN_VALUE = "unknown"
end
