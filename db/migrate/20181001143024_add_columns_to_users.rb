class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :activeL, :boolean, default: true
    add_column :users, :activeR, :boolean, default:true
  end
end
