class RenamePrefectureCodeColumnToItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :prefecture_code, :prefecture_id
  end
end
