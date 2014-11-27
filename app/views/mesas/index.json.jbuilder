json.array!(@mesas) do |mesa|
  json.extract! mesa, :id, :ocupada
  json.url mesa_url(mesa, format: :json)
end
