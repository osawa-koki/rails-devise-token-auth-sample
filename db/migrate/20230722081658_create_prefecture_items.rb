class CreatePrefectureItems < ActiveRecord::Migration[7.0]
  def change
    create_table :prefecture_items do |t|
      t.references :prefecture, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
