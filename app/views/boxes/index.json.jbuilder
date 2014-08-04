json.array!(@boxes) do |box|
  json.extract! box, :id, :title, :description, :price
  json.url box_url(box, format: :json)
end
