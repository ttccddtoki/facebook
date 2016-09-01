class AddContetntToTopixes < ActiveRecord::Migration
  def change
    add_column :topixes, :content, :text
  end
end
