class CreateClinics < ActiveRecord::Migration[7.0]
  def change
    create_table :clinics do |t|
      t.string :display_name
      t.string :status
      t.string :lon
      t.string :lat

      t.timestamps
    end
  end
end
