json.array! @data_no_stations do |data_no_station|
  json.extract! data_no_station, :id, :date_time, :institution, :data_type, :lat, :lon, :swvht, :wspd, :wdir, :sst, :tp, :wvdir, :pres, :atmp, :dewpt, :swvht_swell, :wvdir_swell, :name
end

