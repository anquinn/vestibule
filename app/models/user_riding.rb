class UserRiding < ApplicationRecord
  belongs_to :riding
  belongs_to :user
end
