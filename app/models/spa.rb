class Spa < ApplicationRecord
    has_many :technicians, :dependent => :delete_all
    has_many :treatments
    has_many :appointments, :through => :treatments

    def available_timeslots
        days_array = []
        day_counter = 1
        7.times do
            days_array << (Time.now + day_counter.days)
            day_counter += 1
        end
        days_array = days_array.collect{ |day| day.at_midnight }

        half_hours_array = []
        days_array.each do |day|
            half_hour_counter = 9.to_f
            17.times do
                half_hours_array << (day + half_hour_counter.hours)
                half_hour_counter += 0.5
            end
        end
        
        available_times = []

        half_hours_array.each_with_index do |half_hours, i|
                
            
            if appointments.find_by(appointment_time: half_hours)
            elsif appointment = appointments.find_by(appointment_time: half_hours_array[i-1])
                if appointment.treatment.duration == 60
                else
                    available_times << [half_hours.strftime("%A, %B %e, %Y - %l:%M %P"), half_hours]
                end
            else
                available_times << [half_hours.strftime("%A, %B %e, %Y - %l:%M %P"), half_hours]
            end
        end

        available_times
    end
end
