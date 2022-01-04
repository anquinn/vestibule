class UserUserPermission < ApplicationRecord
  belongs_to :user_permission
  belongs_to :user
end
