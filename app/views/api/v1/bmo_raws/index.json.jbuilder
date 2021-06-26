json.array! @bmo_raws do |bmo_raw|
  json.extract! bmo_raw, :id, :buoy_id, :date_time, :lat, :lon, :battery, :wspd1, :gust1, :wdir1, :wspd2, :gust2, :wdir2, :atmp, :rh, :dewpt, :pres, :sst, :compass, :arad, :cspd1, :cdir1, :cspd2, :cdir2, :cspd3, :cdir3, :swvht1, :tp1, :mxwvht1, :wvdir1, :wvspread1, :swvht2, :tp2, :wvdir2
end
