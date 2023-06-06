class AddAddressToSteps < ActiveRecord::Migration[7.0]
  def change
    add_column :steps, :address, :string
  end
end
