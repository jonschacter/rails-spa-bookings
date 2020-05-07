class Treatment < ApplicationRecord
  belongs_to :spa
  has_many :appointments
  has_many :users, :through => :appointments

  def list_spa_treatment_name
    self.spa.name + " - " + self.name + " - " + self.duration.to_s + " min"
  end

end
