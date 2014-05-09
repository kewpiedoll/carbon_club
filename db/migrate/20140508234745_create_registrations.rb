class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.integer :producer_id
      t.integer :energy_system_id
      #t.string :number  --> this did not auto-create itself for me

      t.timestamps
    end
  end
end
