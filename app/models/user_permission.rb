class UserPermission < ApplicationRecord
	has_many :user_user_permissions, dependent: :destroy
  	has_many :users, through: :user_user_permissions
end
