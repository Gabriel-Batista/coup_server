class AddDefaultToPhaseInMatch < ActiveRecord::Migration[5.2]
    def change
        change_column :matches, :phase, :string, default: "Declare"
    end
end
