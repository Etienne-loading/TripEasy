class RemoveCityFromStep < ActiveRecord::Migration[7.0]
  def change
    remove_column :steps, :city, :string
  end
end
