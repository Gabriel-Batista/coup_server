class ChangePhaseToInteger < ActiveRecord::Migration[5.2]
  def change
    remove_column :matches, :phase, :string
    add_column :matches, :phase, :integer, default: 0
  end
end
