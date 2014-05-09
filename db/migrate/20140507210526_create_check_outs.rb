class CreateCheckOuts < ActiveRecord::Migration
  def change
    create_table :check_outs do |t|
      t.integer :turing_user_id

      t.timestamps
    end
  end
end
