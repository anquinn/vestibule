class EmailPlan < ApplicationRecord
  belongs_to :riding

  enum status: {
    inactive: 0,
    active: 1
  }
end
