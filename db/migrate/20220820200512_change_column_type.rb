class ChangeColumnType < ActiveRecord::Migration[7.0]
  def change
    change_column :clinics, :lat, 'float USING CAST(lat AS float)'
    change_column :clinics, :lon, 'float USING CAST(lon AS float)'
  end
end
