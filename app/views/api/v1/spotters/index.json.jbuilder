json.array! @spotters do |spotter|
  json.extract! spotter, :buoy_id, :id_serial, :date_time, :latitude, :longitude, :battery_power, :battery_voltage, :solar_voltage, :humidity
end
