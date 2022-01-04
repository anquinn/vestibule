class BankBalance < ApplicationRecord
  belongs_to :riding
  monetize :balance_cents, allow_nil: false,
    numericality: {
      greater_than_or_equal_to: 1
    }

  validates :balance_cents, presence: true
end
