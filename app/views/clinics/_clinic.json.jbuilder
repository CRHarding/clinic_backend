json.extract! clinic, :id, :display_name, :status, :lon, :lat, :created_at, :updated_at
json.url clinic_url(clinic, format: :json)
