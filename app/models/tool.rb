class Tool < ApplicationRecord
  has_one_attached :icon

  translates :name, :description, :link

  validates :name_en, :name_fr, :description_en, :description_fr, presence: true
end
