json.extract! voyage, :id, :title, :cover, :description, :user_id, :created_at, :updated_at
json.url voyage_url(voyage, format: :json)
