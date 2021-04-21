json.array! @waves do |wave|
  json.extract! wave, :id, :buoy_id, :date_time, :date_time_2, :number_of_bands, :initial_frequency, :frequency_spacing, :mean_average_direction, :spread_direction, :values
end
