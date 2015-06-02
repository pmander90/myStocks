class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :username
      t.integer :phone_number
      t.string :stocks, array: true, default: []
      t.timestamps null: false
    end
  end
end
