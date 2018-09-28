class AddHandToUsers < ActiveRecord::Migration[5.2]
    def change
        add_column :users, :handL, :integer
        add_column :users, :handR, :integer
        add_column :users, :wallet, :integer
    end
end
