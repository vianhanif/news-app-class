json.extract! agenda, :id, :title, :organizer, :image, :location, :date, :start, :end, :description, :price, :slug, :created_at, :updated_at
json.url agenda_url(agenda, format: :json)
