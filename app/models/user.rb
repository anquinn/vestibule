class User < ApplicationRecord
  include UserOnboarding

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, 
         :validatable, :lockable,
         :omniauthable, omniauth_providers: [:google_oauth2]
         
  has_many :user_ridings
  has_many :ridings, through: :user_ridings

  has_many :user_user_permissions, dependent: :destroy
  has_many :user_permissions, through: :user_user_permissions

  validates :first_name, :last_name, presence: true

  enum user_type: {
    salesforce: 0,
    admin: 1,
    lpc_staff: 2,
  }

  ADMIN_USER_TYPES = [
    ["Salesforce", "salesforce"],
    ["Admin", "admin"],
    ["LPC Staff", "lpc_staff"]
  ]

  LPC_USER_TYPES = [
    ["Salesforce", "salesforce"],
    ["LPC Staff", "salesforce"]
  ]

  USER_TITLES = [
    "DS Admin",
    "Field Organizer",
    "Central Staff",
    "PTB Director"
  ]

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    # Uncomment the section below if you want users to be created if they don't exist
    # unless user
    #     user = User.create(name: data['name'],
    #        email: data['email'],
    #        password: Devise.friendly_token[0,20]
    #     )
    # end
    user
  end
end
