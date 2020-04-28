class CreateTodoLists < ActiveRecord::Migration[5.2]
  def change
    create_table :todo_lists do |t|
      t.text :list, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
