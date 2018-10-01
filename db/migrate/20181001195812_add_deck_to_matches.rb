class AddDeckToMatches < ActiveRecord::Migration[5.2]
  def change
    add_column :matches, :deck, :string, default: "[1,1,1,2,2,2,3,3,3,4,4,4,5,5,5]"
  end
end
