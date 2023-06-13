class AddTagListToSteps < ActiveRecord::Migration[7.0]
  def change
    add_column :steps, :tag_list, :string
  end
end
