class AddDeclaredColumnToMatch < ActiveRecord::Migration[5.2]
  def change
    add_column :matches, :declared, :string
  end
end
