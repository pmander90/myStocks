class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.string :symbol
      t.string :name
      t.integer :open
      t.integer :lastprice
      t.integer :high
      t.integer :low
      t.belongs_to :user
      t.timestamps null: false
    end
  end
end
