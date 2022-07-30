class Api::V1::DataStationsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [ :index, :last, :station, :distinct ]
  after_action :verify_authorized, except: :distinct

  def index
    if params[:token].present?
      user = User.where("authentication_token = ?", params[:token])
      unless user.empty?
        @query = ""
        if params[:start_date].present?
          start_date = Time.strptime(params[:start_date], format="%Y-%m-%dT%H:%M:%S")
          if (start_date >= Time.now.utc || start_date <= Time.now.utc - (3600*24*5))
            start_date = (Time.now.utc - (3600*24*1))
          end
          @query += "date_time >= '#{start_date.strftime("%Y-%m-%d %H:%M:%S")}' AND "
        else
          @query += "date_time >= '#{(Time.now.utc - (3600*24*5)).strftime("%Y-%m-%d %H:%M:%S")}' AND "
        end
        if params[:end_date].present?
          end_date = Time.strptime(params[:end_date], format="%Y-%m-%dT%H:%M:%S")
          if end_date <= Time.now.utc - (3600*24*5)
            end_date = Time.now.utc
          end
          @query += "date_time <= '#{end_date.strftime("%Y-%m-%d %H:%M:%S")}'"
        else
          @query += "date_time <= '#{(Time.now.utc).strftime("%Y-%m-%d %H:%M:%S")}'"
        end
        if params[:station_id].present?
          @query += " AND station_id = #{params[:station_id]}"
        end
        if params[:data_type].present?
          @query += " AND stations.data_type = '#{params[:data_type]}'"
        end
        if params[:institution].present?
          @query += " AND stations.institution = '#{params[:institution]}'"
        end
        if params[:min_lat].present?
          @query += " AND stations.lat >= #{params[:min_lat]}"
        end
        if params[:min_lon].present?
          @query += " AND stations.lon >= #{params[:min_lon]}"
        end
        if params[:max_lat].present?
          @query += " AND stations.lat <= #{params[:max_lat]}"
        end
        if params[:max_lon].present?
          @query += " AND stations.lon <= #{params[:max_lon]}"
        end
        if (@query.downcase.include? 'drop')
          @data_stations = []
        else
          if user[0].admin
            @data_stations = policy_scope(DataStation).includes(:station).joins(:station).where(@query).order(station_id: :asc, date_time: :desc)
          else
            @query += " AND stations.flag = true"
            @data_stations = policy_scope(DataStation).includes(:station).joins(:station).where(@query).order(station_id: :asc, date_time: :desc)
          end
        end
      end
    end
  end


  
  def last
    if params[:token].present?
      user = User.where("authentication_token = ?", params[:token])
      unless user.empty?
        @query = ""
        if params[:start_date].present?
          start_date = Time.strptime(params[:start_date], format="%Y-%m-%dT%H:%M:%S")
          if (start_date >= Time.now.utc || start_date <= Time.now.utc - (3600*24*5))
            start_date = (Time.now.utc - (3600*24*1))
          end
          @query += "date_time >= '#{start_date.strftime("%Y-%m-%d %H:%M:%S")}' AND "
        else
          @query += "date_time >= '#{(Time.now.utc - (3600*24*5)).strftime("%Y-%m-%d %H:%M:%S")}' AND "
        end
        if params[:end_date].present?
          end_date = Time.strptime(params[:end_date], format="%Y-%m-%dT%H:%M:%S")
          if end_date <= Time.now.utc - (3600*24*5)
            end_date = Time.now.utc
          end
          @query += "date_time <= '#{end_date.strftime("%Y-%m-%d %H:%M:%S")}'"
        else
          @query += "date_time <= '#{(Time.now.utc).strftime("%Y-%m-%d %H:%M:%S")}'"
        end
        if params[:station_id].present?
          @query += " AND station_id = #{params[:station_id]}"
        end
        if params[:data_type].present?
          @query += " AND stations.data_type = '#{params[:data_type]}'"
        end
        if params[:institution].present?
          @query += " AND stations.institution = '#{params[:institution]}'"
        end
        if params[:min_lat].present?
          @query += " AND stations.lat >= #{params[:min_lat]}"
        end
        if params[:min_lon].present?
          @query += " AND stations.lon >= #{params[:min_lon]}"
        end
        if params[:max_lat].present?
          @query += " AND stations.lat <= #{params[:max_lat]}"
        end
        if params[:max_lon].present?
          @query += " AND stations.lon <= #{params[:max_lon]}"
        end
        if (@query.downcase.include? 'drop')
          @data_stations = []
        else
          if user[0].admin
            @data_stations = DataStation.select("DISTINCT ON(data_stations.station_id) data_stations.*").includes(:station).joins(:station).where(@query).order(station_id: :asc, date_time: :desc)
          else
            @query += " AND stations.flag = true"
            @data_stations = DataStation.select("DISTINCT ON(data_stations.station_id) data_stations.*").includes(:station).joins(:station).where(@query).order(station_id: :asc, date_time: :desc)
          end
          authorize @data_stations  # For Pundit
        end
      end
    end
  end

  def station
    if params[:token].present?
      user = User.where("authentication_token = ?", params[:token])
      @station = Station.find(params[:station_id])
      unless user.empty?
        if @station
          @query = "station_id = #{@station.id} AND "
          if params[:start_date].present?
            start_date = Time.strptime(params[:start_date], format="%Y-%m-%dT%H:%M:%S")
            if (start_date >= Time.now.utc || start_date <= Time.now.utc - (3600*24*5))
              start_date = (Time.now.utc - (3600*24*1))
            end
            @query += "date_time >= '#{start_date.strftime("%Y-%m-%d %H:%M:%S")}' AND "
          else
            @query += "date_time >= '#{(Time.now.utc - (3600*24*5)).strftime("%Y-%m-%d %H:%M:%S")}' AND "
          end
          if params[:end_date].present?
            end_date = Time.strptime(params[:end_date], format="%Y-%m-%dT%H:%M:%S")
            if end_date <= Time.now.utc - (3600*24*5)
              end_date = Time.now.utc
            end
            @query += "date_time <= '#{end_date.strftime("%Y-%m-%d %H:%M:%S")}'"
          else
            @query += "date_time <= '#{(Time.now.utc).strftime("%Y-%m-%d %H:%M:%S")}'"
          end
          if !@query.downcase.match(/(\/|;|drop|\*|if|\+|\-\-|\!|concat|char|union)/).to_a.empty?
            @data_stations = []
          else
            if user[0].admin
              @data_stations = DataStation.where(@query).order(date_time: :desc)
            else
              @query += " AND stations.flag = true"
              @data_stations = DataStation.joins(:station).where(@query).order(date_time: :desc)
            end
            authorize @data_stations  # For Pundit
          end
        end
      end
    end
  end

  def distinct
    if params[:token].present?
      user = User.where("authentication_token = ?", params[:token])
      unless user.empty?
        @total = policy_scope(DataStation).select('distinct(station_id)').count
        @total = {'total_stations': @total}
        render json: @total.to_json() 
      end
    end
  end


  private

  def render_error
    render json: { errors: @data_station.errors.full_messages },
      status: :unprocessable_entity
  end
end

# date_time >= '2021-10-20 00:00:00' AND date_time <= '2021-10-20 22:04:40' AND stations.data_type = 'buoy'
# select = "station_id, date_time, wspd, wdir, gust, atmp, pres, rh, dewpt, swvht, swvht_swell, swvht_sea, wvdir, wvdir_swell, wvdir_sea, mxwvht, tp, wvspread, water_level, sst, meteorological_tide, cleaning, stations.lon"
# x = DataStation.joins(:station).includes(:station).where("date_time >= '2021-10-20 00:00:00' AND date_time <= '2021-10-20 22:04:40' AND stations.data_type = 'buoy'")


