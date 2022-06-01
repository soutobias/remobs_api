json.array! @data_tides do |data_tide|
  json.id data_tide.id
  json.buoy_id data_tide.buoy_id
  json.date_time data_tide.date_time
  json.elev1 data_tide.swvht1
  json.elev2 data_tide.tp1
end

