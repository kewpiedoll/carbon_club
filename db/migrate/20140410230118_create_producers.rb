class CreateProducers < ActiveRecord::Migration
  def change
    create_table :producers do |t|
      t.string :user_name
      t.string :full_name
      t.integer :re_system_type
      t.integer :init_kwh_reading

      t.timestamps
    end
  end
end
