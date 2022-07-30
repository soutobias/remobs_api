json.array! @stations do |station|
  json.extract! station, :id, :name, :lat, :lon, :data_type, :institution, :url, :flag
end
