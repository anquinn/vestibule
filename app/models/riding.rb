class Riding < ApplicationRecord
	has_many :riding_external_reports, dependent: :destroy
  	has_many :external_reports, through: :riding_external_reports, dependent: :destroy
  	has_many :user_ridings, dependent: :destroy
  	has_one :email_plan, dependent: :destroy
  	has_many :bank_balances, dependent: :destroy

  	translates :name, :province, :member_name, :member_affiliation, :riding_type, :region

  	validates :name_en, :name_fr, :riding_code, presence: true
  	validates :riding_code, uniqueness: true

  	after_create :create_email_plan

  	extend FriendlyId
  	friendly_id :riding_code, use: :slugged

  	def create_email_plan
  		EmailPlan.create(riding: self)
  	end

  	def current_bank_balance
  		if self.bank_balances.any?
  			self.bank_balances.last.balance
  		else
  			0
  		end
  	end

  	def current_bank_balance_updated_date
  		if self.bank_balances.any?
  			self.bank_balances.last.updated_at
  		else
  			nil
  		end
  	end
end
