class CreateZips < ActiveRecord::Migration[7.0]
  def change
    create_table :zips do |t|
      t.string :zip
      t.float :lat
      t.float :lon

      t.timestamps
    end
  end
end
