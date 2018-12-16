class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name
      t.decimal :price, precision: 8, scale: 2
      t.references :category, foreign_key: true
      t.integer :tags, default: [], array: true
      t.timestamps
    end
  end
end
