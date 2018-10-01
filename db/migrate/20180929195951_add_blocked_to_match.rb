class AddBlockedToMatch < ActiveRecord::Migration[5.2]
    def change
        add_column :matches, :blocked, :boolean, default: false
    end
end
