json.array! @data_tides do |data_tide|
  json.id data_tide.id
  json.buoy_id data_tide.buoy_id
  json.date_time data_buoy.date_time
  json.elev1 data_buoy.swvht1
  json.elev2 data_buoy.tp1
end

