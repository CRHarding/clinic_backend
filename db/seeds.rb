# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# t.string :display_name
# t.string :status
# t.float :lon
# t.float :lat

Clinic.create([
  { display_name: "Shorewood Milwaukee", status: "open", lon: -87.896210, lat: 43.048440 },
  { display_name: "Downtown Milwaukee", status: "open", lon: -87.940849, lat: 43.038261 },
  { display_name: "Illinois", status: "open", lon: -88.974289, lat: 39.877331 },
  { display_name: "St Louis", status: "open", lon: -89.981461, lat: 38.600170 },
  { display_name: "Brooklyn", status: "open", lon: -73.991220, lat: 40.692780 },
  { display_name: "Milwaukee Airport", status: "closed", lon: -87.896667, lat: 42.947222 }
])

require 'csv'

csv_text = File.read(Rails.root.join("lib", "seeds", "airports.csv"))
csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
csv.each do |row|
  elem = Airport.new
  elem.name = row["name"]
  elem.type = row["type"]
  elem.lat = row["latitude_deg"]
  elem.lon = row["longitude_deg"]
  elem.region = row["region_name"]
  elem.municipality = row["municipality"]
  elem.iata_code = row["iata_code"]
  elem.save
end

zip_text = File.read(Rails.root.join("lib", "seeds", "zip_us.csv"))
zip_csv = CSV.parse(zip_text, :headers => true, :encoding => "ISO-8859-1")
zip_csv.each do |row|
  elem = Zip.new
  elem.zip = row["postal code"]
  elem.lat = row["latitude"]
  elem.lon = row["longitude"]
  elem.save
end

# status: open, pending