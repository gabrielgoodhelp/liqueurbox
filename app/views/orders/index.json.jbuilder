json.array!(@orders) do |order|
  json.extract! order, :id, :address, :city, :state, :province, :ZIP_code
  json.url order_url(order, format: :json)
end
