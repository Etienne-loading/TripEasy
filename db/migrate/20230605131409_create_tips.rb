class CreateTips < ActiveRecord::Migration[7.0]
  def change
    create_table :tips do |t|
      t.text :content
      t.string :title
      t.string :link
      t.string :category
      t.references :step, null: false, foreign_key: true

      t.timestamps
    end
  end
end
