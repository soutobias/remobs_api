json.array! @data_buoys do |data_buoy|
  json.extract! data_buoy, :id, :buoy_id, :lat, :lon, :date_time, :battery, :compass, :flag_compass, :flood, :rh, :flag_rh, :pres, :flag_pres, :atmp, :flag_atmp, :dewpt, :flag_dewpt, :wspd, :flag_wspd, :wdir, :flag_wdir, :gust, :flag_gust, :arad, :flag_arad, :sst, :flag_sst, :cspd1, :flag_cspd1, :cdir1, :flag_cdir1, :cspd2, :flag_cspd2, :cdir2, :flag_cdir2, :cspd3, :flag_cspd3, :cdir3, :flag_cdir3, :swvht1, :flag_swvht1, :swvht2, :flag_swvht2, :mxwvht1, :flag_mxwvht1, :tp1, :flag_tp1, :tp2, :flag_tp2, :wvdir1, :flag_wvdir1, :wvdir2, :flag_wvdir2, :wvspread1, :flag_wvspread1, :pk_dir, :flag_pk_dir, :pk_wvspread, :flag_pk_wvspread, :mean_tp, :flag_mean_tp
end

