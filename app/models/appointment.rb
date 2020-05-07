class Appointment < ApplicationRecord
  belongs_to :treatment
  belongs_to :technician
  belongs_to :user
  has_one :spa, :through => :treatment

  def readable_time
    appointment_time.strftime("%A, %B %e, %Y - %l:%M %P")
  end
end
