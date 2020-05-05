class CreateTreatments < ActiveRecord::Migration[6.0]
  def change
    create_table :treatments do |t|
      t.belongs_to :spa, null: false, foreign_key: true
      t.string :name
      t.text :description
      t.integer :duration

      t.timestamps
    end
  end
end
