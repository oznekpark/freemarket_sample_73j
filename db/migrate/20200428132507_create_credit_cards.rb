class CreateCreditCards < ActiveRecord::Migration[5.2]
  def change
    create_table :credit_cards do |t|
      t.integer :expiration_year
      t.integer :expiration_month
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
