class ExternalReport < ApplicationRecord
	has_many :riding_external_reports, dependent: :destroy
	translates :name, :description

  	validates :name_en, :name_fr, :description_en, :description_fr, presence: true
end
