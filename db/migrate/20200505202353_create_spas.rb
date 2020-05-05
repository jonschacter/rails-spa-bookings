class CreateSpas < ActiveRecord::Migration[6.0]
  def change
    create_table :spas do |t|
      t.string :name
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone_number

      t.timestamps
    end
  end
end
