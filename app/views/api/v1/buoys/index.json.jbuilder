json.array! @buoys do |buoy|
  json.extract! buoy, :id, :name_buoy, :model, :lat, :lon, :deploy_date, :status, :wmo_number, :duration_wave, :h_sensor_pres, :d_sensor_wtmp, :wtmp_prec, :wind_avg, :h_sensor_wind, :h_sensor_wind, :gust_avg, :atmp_avg, :d_curr
end
