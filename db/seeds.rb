# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = User.create(:username => "admin", :email => "admin@mail.com", :password_digest => User.digest('admin'), :activated => true, :activated_at => Time.now())

admin_role = Role.create(:role_name => LOGIN_SYSTEM_ADMIN, :created_by => admin.id)

UserRole.create(:user_id => admin.id, :role_id => admin_role.id, :assigned_by => admin.id)