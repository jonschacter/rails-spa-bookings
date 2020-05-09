class Treatment < ApplicationRecord
  belongs_to :spa
  has_many :appointments
  has_many :users, :through => :appointments

  validates :name, :presence => true
  validates :description, :presence => true
  validates :description, :length => { maximum: 300 }
  validates :price, :presence => true
  validates :price, :numericality => { :greater_than => 0, :less_than => 1000 }
  validates :duration, :presence => true
  validates :duration, inclusion: { in: [30, 60], :message => "must be 30 or 60"}

  def list_spa_treatment_name
    self.spa.name + " - " + self.name + " - " + self.duration.to_s + " min"
  end

end
