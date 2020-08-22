class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name,             null: false
      t.text :image,              null: false
      t.integer :category,        null: false
      t.integer :price,           null: false
      t.integer :exhibitor,       null: false
      t.integer :status,          null: false
      t.integer :delivery_fee,    null: false 
      t.integer :delivery_time,   null: false
      t.integer :ship_from,       null: false
      t.integer :consumer_id,     null: false,   foreign_key: true
      t.timestamps
    end
  end
end
