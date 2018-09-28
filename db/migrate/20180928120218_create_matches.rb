class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
        t.boolean :completed
        t.integer :seats
        t.string :match_password
      t.timestamps
    end
  end
end
