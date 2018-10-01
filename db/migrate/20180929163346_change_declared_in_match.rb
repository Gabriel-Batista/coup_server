class ChangeDeclaredInMatch < ActiveRecord::Migration[5.2]
    def change
        remove_column :matches, :declared
        add_column :matches, :declared, :integer, default: 0
    end
end
