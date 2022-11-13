json.array! @qualified_values do |qualified_value|
    json.extract! qualified_value, :id, :frequency, :df, :a1, :b1, :a2, :b2, :varianceDensity, :direction, :directionalSpread, :date_time, :latitude, :longitude, :buoy_id
end
