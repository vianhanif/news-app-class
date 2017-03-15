class AgendaSerializer < ActiveModel::Serializer
  attributes :id, :title, :organizer, :image, :location, :date, :start, :end, :description, :price, :slug
end
