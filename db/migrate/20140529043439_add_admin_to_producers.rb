class AddAdminToProducers < ActiveRecord::Migration
  def self.up
    add_column :producers, :admin, :boolean, :default => false
  end

  def self.down
    remove_column :producers, :admin 
  end
end
