class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name,             null: false
      t.integer :category,        null: false
      t.integer :price,           null: false
      t.text :explain,       null: false
      t.integer :status,          null: false
      t.integer :delivery_fee,    null: false 
      t.integer :delivery_time,   null: false
      t.integer :ship_from,       null: false
      t.integer :consumer_id,     foreign_key: true, null: false
      t.timestamps
    end
  end
end
