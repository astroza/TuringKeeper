class AddReasonToCheckIn < ActiveRecord::Migration
  def change
    add_column :check_ins, :reason, :string
  end
end
