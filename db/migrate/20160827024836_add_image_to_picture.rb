class AddImageToPicture < ActiveRecord::Migration
  def change
    add_column :pictures, :image, :string, not: null
  end
end
