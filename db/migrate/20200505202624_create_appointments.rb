class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.belongs_to :treatment, null: false, foreign_key: true
      t.belongs_to :technician, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true
      t.datetime :appointment_time

      t.timestamps
    end
  end
end
