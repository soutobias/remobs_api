json.array! @models do |model|
  json.extract! model, :buoy_id, :model, :date_time, :lat, :lon, :swvht, :wvdir, :tp, :wspd, :wdir
end
