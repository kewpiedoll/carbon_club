class AddEmailtoProducers < ActiveRecord::Migration
  def change
  	add_column :producers, :email, :string
  end
end
