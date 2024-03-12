class CreateWaters < ActiveRecord::Migration[7.1]
  def change
    create_table :waters do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :ounces

      t.timestamps
    end
  end
end
