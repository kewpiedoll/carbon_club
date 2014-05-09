class CreateEnergySystems < ActiveRecord::Migration
  def change
    create_table :energy_systems do |t|
      t.string :title
      t.text :description
      t.integer :producer_id
      t.integer :CO2_rating

      t.timestamps
    end
  end
end
