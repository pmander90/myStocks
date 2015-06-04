class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :username
      t.string :phone_number
      t.belongs_to :user
      t.timestamps null: false
    end
  end
end
