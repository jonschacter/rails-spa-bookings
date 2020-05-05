class Treatment < ApplicationRecord
  belongs_to :spa
  has_many :appointments
  has_many :users, :through => :appointments
end
