class Airport < ApplicationRecord
  def self.get_close_airports(sent_lat, sent_lon)
    sql = ("
      SELECT *
      FROM airports
      WHERE type='large_airport'
      ORDER BY ABS(lat-(#{sent_lat})) + ABS(lon-(#{sent_lon})) ASC
      LIMIT 5
    ")

    result_array = ActiveRecord::Base.connection.execute(sql)
  end
end
