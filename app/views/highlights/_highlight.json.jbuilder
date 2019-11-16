json.extract! highlight, :id, :text, :url, :created_at, :updated_at
json.url highlight_url(highlight, format: :json)
