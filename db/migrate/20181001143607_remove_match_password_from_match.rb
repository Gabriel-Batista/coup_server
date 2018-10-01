class RemoveMatchPasswordFromMatch < ActiveRecord::Migration[5.2]
  def change
    remove_column :matches, :match_password, :string
  end
end
