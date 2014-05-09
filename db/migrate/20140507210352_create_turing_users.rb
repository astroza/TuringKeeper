class CreateTuringUsers < ActiveRecord::Migration
  def change
    create_table :turing_users do |t|
      t.integer :identifier
      t.string :FirstName
      t.string :LastName
      t.string :password

      t.timestamps
    end
  end
end
