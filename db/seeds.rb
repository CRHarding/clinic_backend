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
  { display_name: "first", status: "open", lon: -87.896210, lat: 43.048440 },
  { display_name: "second", status: "open", lon: -87.940849, lat: 43.038261 },
  { display_name: "third", status: "open", lon: -88.974289, lat: 39.877331 },
  { display_name: "fourth", status: "open", lon: -89.981461, lat: 38.600170 },
  { display_name: "fifth", status: "open", lon: -73.991220, lat: 40.692780 },
  { display_name: "sixth", status: "closed", lon: -87.896667, lat: 42.947222 }
])

# status: open, pending