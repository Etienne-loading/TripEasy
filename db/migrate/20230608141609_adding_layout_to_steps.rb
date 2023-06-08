class AddingLayoutToSteps < ActiveRecord::Migration[7.0]
  def change
    add_column :steps, :layout, :integer
  end
end
