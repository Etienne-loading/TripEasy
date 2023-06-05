class CreateBlogs < ActiveRecord::Migration[7.0]
  def change
    create_table :blogs do |t|
      t.string :title
      t.integer :min_price
      t.integer :max_price
      t.date :start_date
      t.date :end_date
      t.boolean :carbon_friendly, default: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
