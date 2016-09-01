class AddImageToTopix < ActiveRecord::Migration
  def change
    add_column :topixes, :image, :string
  end
end
