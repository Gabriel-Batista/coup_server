class ReplaceBlockedColumnInMatch < ActiveRecord::Migration[5.2]
  def change
    remove_column :matches, :blocked, :boolean
    add_column :matches, :target, :integer
  end
end
