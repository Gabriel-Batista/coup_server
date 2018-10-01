class ChangeCurrentMatchToInMatch < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :current_match, :integer
    add_column :users, :in_match, :boolean
  end
end
