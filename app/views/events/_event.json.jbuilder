json.extract! event, :id, :event, :description, :created_at, :updated_at
json.url event_url(event, format: :json)
