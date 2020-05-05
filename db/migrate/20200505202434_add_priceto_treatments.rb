class AddPricetoTreatments < ActiveRecord::Migration[6.0]
  def change
    add_column :treatments, :price, :decimal, :precision=>5, :scale=>2
  end
end
