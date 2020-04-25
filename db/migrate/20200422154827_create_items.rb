class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name,null:false
      t.text :introduction, null: false
      t.integer :price,null: false
      t.string :size_name
      t.integer :size_id, null: false
      t.string :item_condition
      t.integer :item_condition_id, null: false
      t.string :postage_payer
      t.integer :postage_payer_id, null: false
      t.string :preparation_day_name
      t.integer :preparation_day_id, null: false
      t.string :postage_type
      t.integer :postage_type_id, null: false
      #t.references :brand , foreign_key: true
      t.integer :prefecture_code , null: false
      #t.references :item_img , null: false, foreign_key: true
      t.integer :trading_status, default: 0, null: false, limit: 1
      t.references :user, null: false, foreign_key: true
      t.timestamp :deal_closed_date
      t.timestamps
    end
  end
end
