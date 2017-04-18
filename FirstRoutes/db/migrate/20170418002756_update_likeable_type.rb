class UpdateLikeableType < ActiveRecord::Migration[5.0]
  def change
    change_column :likes, :likeable_type, :string, null: false
  end
end
