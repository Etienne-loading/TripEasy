class AddValueToLikes < ActiveRecord::Migration[7.0]
  def change
    add_column :likes, :value, :integer, default: 0
  end
end
