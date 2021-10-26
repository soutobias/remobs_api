json.array! @tags do |tag|
  json.extract! tag, :id, :id_tag, :buoy_id, :date_time, :lat, :lon
end
