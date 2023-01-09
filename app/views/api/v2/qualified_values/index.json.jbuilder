if params[:petrobras]
    if @qualified_values.empty?
        xs = [0]
        json.array! xs do |x|
            json.Timestamp Time.zone.now.to_i
        end
    else
        json.array! @qualified_values do |qualified_value|
            json.id qualified_value.id
            json.raw_id qualified_value.raw_id
            json.buoy_id qualified_value.buoy_id
            json.date_time qualified_value.date_time
            json.Timestamp qualified_value.date_time.to_i*1000

            if qualified_value.latitude
                json.Latitude qualified_value.latitude.to_f
            else
                json.Latitude qualified_value.latitude
            end

            if qualified_value.longitude
                json.Longitude qualified_value.longitude.to_f
            else
                json.Longitude qualified_value.longitude
            end

            json.geom qualified_value.geom
        
            if qualified_value.battery
                json.battery qualified_value.battery.to_f
            else
                json.battery qualified_value.battery
            end
            json.flag_battery qualified_value.flag_battery

            if qualified_value.rh
                json.HMS_HUMIDITY qualified_value.rh.to_f
            else
                json.HMS_HUMIDITY qualified_value.rh
            end
            json.flag_HMS_HUMIDITY qualified_value.flag_rh

            if qualified_value.wspd1
                json.HMS_WIND_SPEED qualified_value.wspd1.to_f
            else
                json.HMS_WIND_SPEED qualified_value.wspd1
            end
            json.flag_HMS_WIND_SPEED qualified_value.flag_wspd1

            if qualified_value.wdir1
                json.HMS_WIND_DIRECTION qualified_value.wdir1.to_f
            else
                json.HMS_WIND_DIRECTION qualified_value.wdir1
            end
            json.flag_HMS_WIND_DIRECTION qualified_value.flag_wdir1

            if qualified_value.wspd2
                json.HMS_WIND_SPEED2 qualified_value.wspd2.to_f
            else
                json.HMS_WIND_SPEED2 qualified_value.wspd2
            end  
            json.flag_HMS_WIND_SPEED2 qualified_value.flag_wspd2

            if qualified_value.wdir2
                json.HMS_WIND_DIRECTION2 qualified_value.wdir2.to_f
            else
                json.HMS_WIND_DIRECTION2 qualified_value.wdir2
            end
            json.flag_HMS_WIND_DIRECTION2 qualified_value.flag_wdir2

            if qualified_value.gust1
                json.gust qualified_value.gust1.to_f
            else
                json.gust qualified_value.gust1
            end
            json.flag_gust qualified_value.flag_gust1

            if qualified_value.gust2
                json.gust2 qualified_value.gust2.to_f
            else
                json.gust2 qualified_value.gust2
            end
            json.flag_gust2 qualified_value.flag_gust2

            if qualified_value.atmp
                json.HMS_TEMPERATURE qualified_value.atmp.to_f
            else
                json.HMS_TEMPERATURE qualified_value.atmp
            end
            json.flag_HMS_TEMPERATURE qualified_value.flag_atmp

            if qualified_value.pres
                json.HMS_PRESSURE qualified_value.pres.to_f
            else
                json.HMS_PRESSURE qualified_value.pres
            end
            json.flag_HMS_PRESSURE qualified_value.flag_pres

            if qualified_value.srad
                json.srad qualified_value.srad.to_f
            else
                json.srad qualified_value.srad
            end
            json.flag_srad qualified_value.flag_srad

            if qualified_value.dewpt
                json.dewpt qualified_value.dewpt.to_f
            else
                json.dewpt qualified_value.dewpt
            end
            json.flag_dewpt qualified_value.flag_dewpt

            if qualified_value.sst
                json.TEMPERATURA_AGUA qualified_value.sst.to_f
            else
                json.TEMPERATURA_AGUA qualified_value.sst
            end
            json.flag_TEMPERATURA_AGUA qualified_value.flag_sst

            if qualified_value.cspd1
                json.ADCP_BIN1_SPEED qualified_value.cspd1.to_f
            else
                json.ADCP_BIN1_SPEED qualified_value.cspd1
            end
            json.flag_ADCP_BIN1_SPEED qualified_value.flag_cspd1

            if qualified_value.cdir1
                json.ADCP_BIN1_DIRECTION qualified_value.cdir1.to_f
            else
                json.ADCP_BIN1_DIRECTION qualified_value.cdir1
            end
            json.flag_ADCP_BIN1_DIRECTION qualified_value.flag_cdir1
            json.ADCP_BIN1_DEPTH 5.0

            if qualified_value.cspd2
                json.ADCP_BIN2_SPEED qualified_value.cspd2.to_f
            else
                json.ADCP_BIN2_SPEED qualified_value.cspd2
            end
            json.flag_ADCP_BIN2_SPEED qualified_value.flag_cspd2

            if qualified_value.cdir2
                json.ADCP_BIN2_DIRECTION qualified_value.cdir2.to_f
            else
                json.ADCP_BIN2_DIRECTION qualified_value.cdir2
            end
            json.flag_ADCP_BIN2_DIRECTION qualified_value.flag_cdir2        
            json.ADCP_BIN2_DEPTH 8.5


            if qualified_value.cspd3
                json.ADCP_BIN3_SPEED qualified_value.cspd3.to_f
            else
                json.ADCP_BIN3_SPEED qualified_value.cspd3
            end
            json.flag_ADCP_BIN3_SPEED qualified_value.flag_cspd3

            if qualified_value.cdir3
                json.ADCP_BIN3_DIRECTION qualified_value.cdir3.to_f
            else
                json.ADCP_BIN3_DIRECTION qualified_value.cdir3
            end
            json.flag_ADCP_BIN3_DIRECTION qualified_value.flag_cdir3        
            json.ADCP_BIN3_DEPTH 12.0


            if qualified_value.cspd4
                json.ADCP_BIN4_SPEED qualified_value.cspd4.to_f
            else
                json.ADCP_BIN4_SPEED qualified_value.cspd4
            end
            json.flag_ADCP_BIN4_SPEED qualified_value.flag_cspd4

            if qualified_value.cdir4
                json.ADCP_BIN4_DIRECTION qualified_value.cdir4.to_f
            else
                json.ADCP_BIN4_DIRECTION qualified_value.cdir4
            end
            json.flag_ADCP_BIN4_DIRECTION qualified_value.flag_cdir4        
            json.ADCP_BIN4_DEPTH 15.5


            if qualified_value.cspd5
                json.ADCP_BIN5_SPEED qualified_value.cspd5.to_f
            else
                json.ADCP_BIN5_SPEED qualified_value.cspd5
            end
            json.flag_ADCP_BIN5_SPEED qualified_value.flag_cspd5

            if qualified_value.cdir5
                json.ADCP_BIN5_DIRECTION qualified_value.cdir5.to_f
            else
                json.ADCP_BIN5_DIRECTION qualified_value.cdir5
            end
            json.flag_ADCP_BIN5_DIRECTION qualified_value.flag_cdir5      
            json.ADCP_BIN5_DEPTH 19.0


            if qualified_value.cspd6
                json.ADCP_BIN6_SPEED qualified_value.cspd6.to_f
            else
                json.ADCP_BIN6_SPEED qualified_value.cspd6
            end
            json.flag_ADCP_BIN6_SPEED qualified_value.flag_cspd6

            if qualified_value.cdir6
                json.ADCP_BIN6_DIRECTION qualified_value.cdir6.to_f
            else
                json.ADCP_BIN6_DIRECTION qualified_value.cdir6
            end
            json.flag_ADCP_BIN6_DIRECTION qualified_value.flag_cdir6       
            json.ADCP_BIN6_DEPTH 22.5


            if qualified_value.cspd7
                json.ADCP_BIN7_SPEED qualified_value.cspd7.to_f
            else
                json.ADCP_BIN7_SPEED qualified_value.cspd7
            end
            json.flag_ADCP_BIN7_SPEED qualified_value.flag_cspd7

            if qualified_value.cdir7
                json.ADCP_BIN7_DIRECTION qualified_value.cdir7.to_f
            else
                json.ADCP_BIN7_DIRECTION qualified_value.cdir7
            end
            json.flag_ADCP_BIN7_DIRECTION qualified_value.flag_cdir7        
            json.ADCP_BIN7_DEPTH 26.0


            if qualified_value.cspd8
                json.ADCP_BIN8_SPEED qualified_value.cspd8.to_f
            else
                json.ADCP_BIN8_SPEED qualified_value.cspd8
            end
            json.flag_ADCP_BIN8_SPEED qualified_value.flag_cspd8

            if qualified_value.cdir8
                json.ADCP_BIN8_DIRECTION qualified_value.cdir8.to_f
            else
                json.ADCP_BIN8_DIRECTION qualified_value.cdir8
            end
            json.flag_ADCP_BIN8_DIRECTION qualified_value.flag_cdir8        
            json.ADCP_BIN8_DEPTH 29.5


            if qualified_value.cspd9
                json.ADCP_BIN9_SPEED qualified_value.cspd9.to_f
            else
                json.ADCP_BIN9_SPEED qualified_value.cspd9
            end
            json.flag_ADCP_BIN9_SPEED qualified_value.flag_cspd9

            if qualified_value.cdir9
                json.ADCP_BIN9_DIRECTION qualified_value.cdir9.to_f
            else
                json.ADCP_BIN9_DIRECTION qualified_value.cdir9
            end
            json.flag_ADCP_BIN9_DIRECTION qualified_value.flag_cdir9        
            json.ADCP_BIN9_DEPTH 33.0


            if qualified_value.cspd10
                json.ADCP_BIN10_SPEED qualified_value.cspd10.to_f
            else
                json.ADCP_BIN10_SPEED qualified_value.cspd10
            end
            json.flag_ADCP_BIN10_SPEED qualified_value.flag_cspd10

            if qualified_value.cdir10
                json.ADCP_BIN10_DIRECTION qualified_value.cdir10.to_f
            else
                json.ADCP_BIN10_DIRECTION qualified_value.cdir10
            end
            json.flag_ADCP_BIN10_DIRECTION qualified_value.flag_cdir10
            json.ADCP_BIN10_DEPTH 36.5


            if qualified_value.cspd11
                json.ADCP_BIN11_SPEED qualified_value.cspd11.to_f
            else
                json.ADCP_BIN11_SPEED qualified_value.cspd11
            end
            json.flag_ADCP_BIN11_SPEED qualified_value.flag_cspd11

            if qualified_value.cdir11
                json.ADCP_BIN11_DIRECTION qualified_value.cdir11.to_f
            else
                json.ADCP_BIN11_DIRECTION qualified_value.cdir11
            end
            json.flag_ADCP_BIN11_DIRECTION qualified_value.flag_cdir11        
            json.ADCP_BIN11_DEPTH 40.0


            if qualified_value.cspd12
                json.ADCP_BIN12_SPEED qualified_value.cspd12.to_f
            else
                json.ADCP_BIN12_SPEED qualified_value.cspd12
            end
            json.flag_ADCP_BIN12_SPEED qualified_value.flag_cspd12

            if qualified_value.cdir12
                json.ADCP_BIN12_DIRECTION qualified_value.cdir12.to_f
            else
                json.ADCP_BIN12_DIRECTION qualified_value.cdir12
            end
            json.flag_ADCP_BIN12_DIRECTION qualified_value.flag_cdir12        
            json.ADCP_BIN12_DEPTH 43.5


            if qualified_value.cspd13
                json.ADCP_BIN13_SPEED qualified_value.cspd13.to_f
            else
                json.ADCP_BIN13_SPEED qualified_value.cspd13
            end
            json.flag_ADCP_BIN13_SPEED qualified_value.flag_cspd13

            if qualified_value.cdir13
                json.ADCP_BIN13_DIRECTION qualified_value.cdir13.to_f
            else
                json.ADCP_BIN13_DIRECTION qualified_value.cdir13
            end
            json.flag_ADCP_BIN13_DIRECTION qualified_value.flag_cdir13      
            json.ADCP_BIN13_DEPTH 47.0


            if qualified_value.cspd14
                json.ADCP_BIN14_SPEED qualified_value.cspd14.to_f
            else
                json.ADCP_BIN14_SPEED qualified_value.cspd14
            end
            json.flag_ADCP_BIN14_SPEED qualified_value.flag_cspd14

            if qualified_value.cdir14
                json.ADCP_BIN14_DIRECTION qualified_value.cdir14.to_f
            else
                json.ADCP_BIN14_DIRECTION qualified_value.cdir14
            end
            json.flag_ADCP_BIN14_DIRECTION qualified_value.flag_cdir14        
            json.ADCP_BIN14_DEPTH 50.5


            if qualified_value.cspd15
                json.ADCP_BIN15_SPEED qualified_value.cspd15.to_f
            else
                json.ADCP_BIN15_SPEED qualified_value.cspd15
            end
            json.flag_ADCP_BIN15_SPEED qualified_value.flag_cspd15

            if qualified_value.cdir15
                json.ADCP_BIN15_DIRECTION qualified_value.cdir15.to_f
            else
                json.ADCP_BIN15_DIRECTION qualified_value.cdir15
            end
            json.flag_ADCP_BIN15_DIRECTION qualified_value.flag_cdir15        
            json.ADCP_BIN15_DEPTH 54.0


            if qualified_value.cspd16
                json.ADCP_BIN16_SPEED qualified_value.cspd16.to_f
            else
                json.ADCP_BIN16_SPEED qualified_value.cspd16
            end
            json.flag_ADCP_BIN16_SPEED qualified_value.flag_cspd16

            if qualified_value.cdir16
                json.ADCP_BIN16_DIRECTION qualified_value.cdir16.to_f
            else
                json.ADCP_BIN16_DIRECTION qualified_value.cdir16
            end
            json.flag_ADCP_BIN16_DIRECTION qualified_value.flag_cdir16      
            json.ADCP_BIN16_DEPTH 57.5


            if qualified_value.cspd17
                json.ADCP_BIN17_SPEED qualified_value.cspd17.to_f
            else
                json.ADCP_BIN17_SPEED qualified_value.cspd17
            end
            json.flag_ADCP_BIN17_SPEED qualified_value.flag_cspd17

            if qualified_value.cdir17
                json.ADCP_BIN17_DIRECTION qualified_value.cdir17.to_f
            else
                json.ADCP_BIN17_DIRECTION qualified_value.cdir17
            end
            json.flag_ADCP_BIN17_DIRECTION qualified_value.flag_cdir17        
            json.ADCP_BIN17_DEPTH 61.0


            if qualified_value.cspd18
                json.ADCP_BIN18_SPEED qualified_value.cspd18.to_f
            else
                json.ADCP_BIN18_SPEED qualified_value.cspd18
            end
            json.flag_ADCP_BIN18_SPEED qualified_value.flag_cspd18

            if qualified_value.cdir18
                json.ADCP_BIN18_DIRECTION qualified_value.cdir18.to_f
            else
                json.ADCP_BIN18_DIRECTION qualified_value.cdir18
            end
            json.flag_ADCP_BIN18_DIRECTION qualified_value.flag_cdir18     
            json.ADCP_BIN18_DEPTH 64.5


            if qualified_value.cspd19
                json.ADCP_BIN19_SPEED qualified_value.cspd19.to_f
            else
                json.ADCP_BIN19_SPEED qualified_value.cspd19
            end
            json.flag_ADCP_BIN19_SPEED qualified_value.flag_cspd19

            if qualified_value.cdir19
                json.ADCP_BIN19_DIRECTION qualified_value.cdir19.to_f
            else
                json.ADCP_BIN19_DIRECTION qualified_value.cdir19
            end
            json.flag_ADCP_BIN19_DIRECTION qualified_value.flag_cdir19        
            json.ADCP_BIN19_DEPTH 68.0


            if qualified_value.cspd20
                json.ADCP_BIN20_SPEED qualified_value.cspd20.to_f
            else
                json.ADCP_BIN20_SPEED qualified_value.cspd20
            end
            json.flag_ADCP_BIN20_SPEED qualified_value.flag_cspd20

            if qualified_value.cdir20
                json.ADCP_BIN20_DIRECTION qualified_value.cdir20.to_f
            else
                json.ADCP_BIN20_DIRECTION qualified_value.cdir20
            end
            json.flag_ADCP_BIN20_DIRECTION qualified_value.flag_cdir20       
            json.ADCP_BIN20_DEPTH 71.5

            if qualified_value.swvht1
                json.ONDA_ALTURA_SENSOR1 qualified_value.swvht1.to_f
            else
                json.ONDA_ALTURA_SENSOR1 qualified_value.swvht1
            end
            json.flag_ONDA_ALTURA_SENSOR1 qualified_value.flag_swvht1

            if qualified_value.tp1
                json.ONDA_PERIODO_SENSOR1 qualified_value.tp1.to_f
            else
                json.ONDA_PERIODO_SENSOR1 qualified_value.tp1
            end
            json.flag_ONDA_PERIODO_SENSOR1 qualified_value.flag_tp1

            if qualified_value.mxwvht1
                json.mxwvht1 qualified_value.mxwvht1.to_f
            else
                json.mxwvht1 qualified_value.mxwvht1
            end
            json.flag_mxwvht1 qualified_value.flag_mxwvht1


            if qualified_value.wvdir1
                json.ONDA_DIRECAOMED_SENSOR1 qualified_value.wvdir1.to_f
            else
                json.ONDA_DIRECAOMED_SENSOR1 qualified_value.wvdir1
            end
            json.flag_ONDA_DIRECAOMED_SENSOR1 qualified_value.flag_wvdir1

            if qualified_value.wvspread1
                json.wvspread1 qualified_value.wvspread1.to_f
            else
                json.wvspread1 qualified_value.wvspread1
            end
            json.flag_wvspread1 qualified_value.flag_wvspread1

            if qualified_value.swvht2
                json.ONDA_ALTURA_SENSOR2 qualified_value.swvht2.to_f
            else
                json.ONDA_ALTURA_SENSOR2 qualified_value.swvht2
            end
            json.flag_ONDA_ALTURA_SENSOR2 qualified_value.flag_swvht2

            if qualified_value.tp2
                json.ONDA_PERIODO_SENSOR2 qualified_value.tp2.to_f
            else
                json.ONDA_PERIODO_SENSOR2 qualified_value.tp2
            end
            json.flag_ONDA_PERIODO_SENSOR2 qualified_value.flag_tp2

            if qualified_value.wvdir2
                json.ONDA_DIRECAOMED_SENSOR2 qualified_value.wvdir2.to_f
            else
                json.ONDA_DIRECAOMED_SENSOR2 qualified_value.wvdir2
            end
            json.flag_ONDA_DIRECAOMED_SENSOR2 qualified_value.flag_wvdir2

            if qualified_value.tm1
                json.tm1 qualified_value.tm1.to_f
            else
                json.tm1 qualified_value.tm1
            end
            json.flag_tm1 qualified_value.flag_tm1

            if qualified_value.pkdir1
                json.pkdir1 qualified_value.pkdir1.to_f
            else
                json.pkdir1 qualified_value.pkdir1        
            end
            json.flag_pkdir1 qualified_value.flag_pkdir1

            if qualified_value.pkspread1
                json.pkspread1 qualified_value.pkspread1.to_f
            else
                json.pkspread1 qualified_value.pkspread1
            end
            json.flag_pkspread1 qualified_value.flag_pkspread1

            json.sensors_data_flagged qualified_value.sensors_data_flagged

            if qualified_value.cond
                json.cond qualified_value.cond.to_f
            else
                json.cond qualified_value.cond
            end
            json.flag_cond qualified_value.flag_cond

            if qualified_value.sss
                json.sss qualified_value.sss.to_f
            else
                json.sss qualified_value.sss
            end
            json.flag_sss qualified_value.flag_sss
        end
    end    
else
    json.array! @qualified_values do |qualified_value|
        json.extract! qualified_value, :id, :raw_id, :buoy_id, :date_time, :latitude, :longitude, :geom, :battery, :flag_battery, :rh, :flag_rh, :wspd1, :flag_wspd1, :wdir1, :flag_wdir1, :wspd2, :flag_wspd2, :wdir2, :flag_wdir2, :gust1, :flag_gust1, :gust2, :flag_gust2, :atmp, :flag_atmp, :pres, :flag_pres, :srad, :flag_srad, :dewpt, :flag_dewpt, :sst, :flag_sst, :cspd1, :flag_cspd1, :cdir1, :flag_cdir1, :cspd2, :flag_cspd2, :cdir2, :flag_cdir2, :cspd3, :flag_cspd3, :cdir3, :flag_cdir3, :cspd4, :flag_cspd4, :cdir4, :flag_cdir4, :cspd5, :flag_cspd5, :cdir5, :flag_cdir5, :cspd6, :flag_cspd6, :cdir6, :flag_cdir6, :cspd7, :flag_cspd7, :cdir7, :flag_cdir7, :cspd8, :flag_cspd8, :cdir8, :flag_cdir8, :cspd9, :flag_cspd9, :cdir9, :flag_cdir9, :cspd10, :flag_cspd10, :cdir10, :flag_cdir10, :cspd11, :flag_cspd11, :cdir11, :flag_cdir11, :cspd12, :flag_cspd12, :cdir12, :flag_cdir12, :cspd13, :flag_cspd13, :cdir13, :flag_cdir13, :cspd14, :flag_cspd14, :cdir14, :flag_cdir14, :cspd15, :flag_cspd15, :cdir15, :flag_cdir15, :cspd16, :flag_cspd16, :cdir16, :flag_cdir16, :cspd17, :flag_cspd17, :cdir17, :flag_cdir17, :cspd18, :flag_cspd18, :cdir18, :flag_cdir18, :cspd19, :flag_cspd19, :cdir19, :flag_cdir19, :cspd20, :flag_cspd20, :cdir20, :flag_cdir20, :swvht1, :flag_swvht1, :tp1, :flag_tp1, :mxwvht1, :flag_mxwvht1, :wvdir1, :flag_wvdir1, :wvspread1, :flag_wvspread1, :swvht2, :flag_swvht2, :tp2, :flag_tp2, :wvdir2, :flag_wvdir2, :tm1, :flag_tm1, :pkdir1, :flag_pkdir1, :pkspread1, :flag_pkspread1, :sensors_data_flagged, :cond, :flag_cond, :sss, :flag_sss
    end
end
