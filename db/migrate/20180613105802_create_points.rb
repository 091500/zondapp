class CreatePoints < ActiveRecord::Migration[5.2]
  def change
    create_table :points do |t|
      t.string :title
      t.float :lat
      t.float :lon
      t.float :altitude
      t.decimal :direction
      t.text :params

      t.timestamps
    end
  end
end
