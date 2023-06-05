class CreateSteps < ActiveRecord::Migration[7.0]
  def change
    create_table :steps do |t|
      t.string :title
      t.string :city
      t.text :content
      t.integer :duration
      t.float :latitude
      t.float :longitude
      t.string :country
      t.references :blog, null: false, foreign_key: true

      t.timestamps
    end
  end
end
