if params[:petrobras]
    json.array! @data_buoys do |data_buoy|
      json.id data_buoy.id
      json.buoy_id data_buoy.buoy_id
      json.Latitude data_buoy.lat
      json.Longitude data_buoy.lon
      json.Timestamp data_buoy.date_time
      json.battery data_buoy.battery
      json.DP_Gyro1_Heading data_buoy.compass
      json.flag_DP_Gyro1_Heading data_buoy.flag_compass
      json.flood data_buoy.flood
      json.HMS_HUMIDITY data_buoy.rh
      json.flag_HMS_HUMIDITY data_buoy.flag_rh
      json.HMS_PRESSURE data_buoy.pres
      json.flag_HMS_PRESSURE data_buoy.flag_pres
      json.HMS_TEMPERATURE data_buoy.atmp
      json.flag_HMS_TEMPERATURE data_buoy.flag_atmp
      json.dewpt data_buoy.dewpt
      json.flag_dewpt data_buoy.flag_dewpt
      json.HMS_WIND_SPEED data_buoy.wspd
      json.flag_HMS_WIND_SPEED data_buoy.flag_wspd
      json.HMS_WIND_DIRECTION data_buoy.wdir
      json.flag_HMS_WIND_DIRECTION data_buoy.flag_wdir
      json.gust data_buoy.gust
      json.flag_gust data_buoy.gust
      json.arad data_buoy.arad
      json.flag_arad data_buoy.flag_arad
      json.TEMPERATURA_AGUA data_buoy.sst
      json.flag_TEMPERATURA_AGUA data_buoy.flag_sst
      json.CURRENTMETER_DIRECTION data_buoy.cdir1
      json.flag_CURRENTMETER_DIRECTION data_buoy.flag_cdir1
      json.CURRENTMETER_SPEED data_buoy.cspd1
      json.flag_CURRENTMETER_SPEED data_buoy.flag_cspd1
      json.ADCP_BIN2_DIRECTION data_buoy.cdir2
      json.flag_ADCP_BIN2_DIRECTION data_buoy.flag_cdir2
      json.ADCP_BIN2_SPEED data_buoy.cspd2
      json.flag_ADCP_BIN2_SPEED data_buoy.cspd2
      json.ADCP_BIN3_DIRECTION data_buoy.cdir3
      json.flag_ADCP_BIN3_DIRECTION data_buoy.flag_cdir3
      json.ADCP_BIN3_SPEED data_buoy.cspd3
      json.flag_ADCP_BIN3_SPEED data_buoy.cspd3
      json.ONDA_ALTURA_SENSOR1 data_buoy.swvht1
      json.flag_ONDA_ALTURA_SENSOR1 data_buoy.flag_swvht1
      json.ONDA_ALTURA_SENSOR2 data_buoy.swvht2
      json.flag_ONDA_ALTURA_SENSOR2 data_buoy.flag_swvht2
      json.mxwvht1 data_buoy.mxwvht1
      json.flag_mxwvht1 data_buoy.flag_mxwvht1
      json.ONDA_PERIODO_SENSOR1 data_buoy.tp1
      json.flag_ONDA_PERIODO_SENSOR1 data_buoy.flag_tp1
      json.ONDA_PERIODO_SENSOR2 data_buoy.tp2
      json.flag_ONDA_PERIODO_SENSOR2 data_buoy.flag_tp2
      json.ONDA_DIRECAOMED_SENSOR1 data_buoy.wvdir1
      json.flag_ONDA_DIRECAOMED_SENSOR1 data_buoy.flag_wvdir1
      json.ONDA_DIRECAOMED_SENSOR2 data_buoy.wvdir2
      json.flag_ONDA_DIRECAOMED_SENSOR2 data_buoy.flag_wvdir2
      json.wvspread1 data_buoy.wvspread1
      json.flag_wvspread1 data_buoy.flag_wvspread1
      json.pk_dir data_buoy.pk_dir
      json.flag_pk_dir data_buoy.flag_pk_dir
      json.pk_wvspread data_buoy.flag_pk_wvspread
      json.mean_tp data_buoy.mean_tp
      json.flag_mean_tp data_buoy.flag_mean_tp
    end
  else
    json.array! @data_buoys do |data_buoy|
      json.extract! data_buoy, :id, :buoy_id, :lat, :lon, :date_time, :battery, :compass, :flag_compass, :flood, :rh, :flag_rh, :pres, :flag_pres, :atmp, :flag_atmp, :dewpt, :flag_dewpt, :wspd, :flag_wspd, :wdir, :flag_wdir, :gust, :flag_gust, :arad, :flag_arad, :sst, :flag_sst, :cspd1, :flag_cspd1, :cdir1, :flag_cdir1, :cspd2, :flag_cspd2, :cdir2, :flag_cdir2, :cspd3, :flag_cspd3, :cdir3, :flag_cdir3, :swvht1, :flag_swvht1, :swvht2, :flag_swvht2, :mxwvht1, :flag_mxwvht1, :tp1, :flag_tp1, :tp2, :flag_tp2, :wvdir1, :flag_wvdir1, :wvdir2, :flag_wvdir2, :wvspread1, :flag_wvspread1, :pk_dir, :flag_pk_dir, :pk_wvspread, :flag_pk_wvspread, :mean_tp, :flag_mean_tp
    end
  end
  
  
  