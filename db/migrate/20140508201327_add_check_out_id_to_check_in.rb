class AddCheckOutIdToCheckIn < ActiveRecord::Migration
  def change
    add_column :check_ins, :check_out_id, :integer
  end
end
