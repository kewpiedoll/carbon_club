class AddApprovedToProducer < ActiveRecord::Migration
  def self.up
    add_column :producers, :approved, :boolean, :default => false, :null => false
    add_index  :producers, :approved
  end

  def self.down
    remove_index  :producers, :approved
    remove_column :producers, :approved
  end
end
