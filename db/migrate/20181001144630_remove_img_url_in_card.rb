class RemoveImgUrlInCard < ActiveRecord::Migration[5.2]
  def change
    remove_column :cards, :imgURL, :string
  end
end
