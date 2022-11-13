json.array! @qualified_values do |qualified_value|
    json.extract! qualified_value, :id, :wspd1, :wdir1, :latitude, :longitude, :date_time, :swvht1, :tp1, :tm1, :pkdir1, :pkspread1, :wvdir1, :wvspread1, :sst, :buoy_id
end
