class User < ApplicationRecord
    has_many :appointments
    has_many :technicians, :through => :appointments
    has_many :treatments, :through => :appointments
    devise :database_authenticatable, :registerable, :validatable, :omniauthable, :omniauth_providers => [:github]

    def self.from_omniauth(auth)
        where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.name = auth.info.name
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
      end      
    end
end
