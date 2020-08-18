class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :product    ,null: false
      t.text    :image      ,null: false
      t.string  :category   
      t.integer :price      ,null: false
      t.string  :exhibitor  ,null: false
      t.timestamps
    end
  end
end
