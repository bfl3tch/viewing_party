json.extract! viewer, :id, :title, :host, :start_time, :date, :duration, :created_at, :updated_at
json.url viewer_url(viewer, format: :json)
