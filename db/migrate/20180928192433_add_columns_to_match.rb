class AddColumnsToMatch < ActiveRecord::Migration[5.2]
    def change
        add_column :matches, :phase, :string
        add_column :matches, :turn, :string
    end
end
