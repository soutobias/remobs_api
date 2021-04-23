json.array! @waves do |wave|
  json.extract! wave, :buoy_id, :data_id, :date_time, :mean_average_direction, :spread_direction,:period, :energy, :wvdir, :spread
end
