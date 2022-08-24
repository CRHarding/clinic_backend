class CreateAirports < ActiveRecord::Migration[7.0]
  def change
    create_table :airports do |t|
      t.string :name
      t.string :type
      t.float :lat
      t.float :lon
      t.string :region
      t.string :municipality
      t.string :iata_code

      t.timestamps
    end
  end
end
