class Clinic < ApplicationRecord
  def self.get_close_clinics(sent_lat, sent_lon)
    sql = ("
      SELECT *
      FROM clinics
      WHERE status='open'
      ORDER BY ABS(lat-(#{sent_lat})) + ABS(lon-(#{sent_lon})) ASC
      LIMIT 5
    ")

    result_array = ActiveRecord::Base.connection.execute(sql)
  end
end