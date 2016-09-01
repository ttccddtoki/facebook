class CreateTopixes < ActiveRecord::Migration
  def change
    create_table :topixes do |t|

      t.timestamps null: false
    end
  end
end
