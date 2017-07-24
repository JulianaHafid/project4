json.extract! profile, :id, :user_id, :name, :contact, :address, :gender, :image, :created_at, :updated_at
json.url profile_url(profile, format: :json)
