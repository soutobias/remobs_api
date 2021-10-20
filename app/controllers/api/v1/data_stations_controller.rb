class Api::V1::DataStationsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [ :index ]

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
        @joins = ''
        if params[:data_type].present? || params[:institution].present? || params[:min_lat].present? || params[:min_lon].present? || params[:max_lat].present? || params[:max_lon].present?
          @joins = "INNER JOIN stations on stations.id = data_stations.station_id"
          if params[:data_type].present?
            @joins += " AND stations.data_type = '#{params[:data_type]}'"
          end
          if params[:institution].present?
            @joins += " AND stations.institution = '#{params[:institution]}'"
          end
          if params[:min_lat].present?
            @joins += " AND lat >= #{params[:min_lat]}"
          end
          if params[:min_lon].present?
            @joins += " AND lon >= #{params[:min_lon]}"
          end
          if params[:max_lat].present?
            @joins += " AND lat <= #{params[:max_lat]}"
          end
          if params[:max_lon].present?
            @joins += " AND lon <= #{params[:max_lon]}"
          end
        end

        if (@query.downcase.include? 'drop') || (@joins.downcase.include? 'drop')
          @data_stations = []
        else
          if @joins != ''
            @data_stations = policy_scope(DataStation).joins(@joins).where(@query)
          else
            @data_stations = policy_scope(DataStation).where(@query)
          end
        end
      end
    end
  end

  def show
    @data_station = DataStation.where("id = params[:id]")
    authorize @data_station  # For Pundit
  end

  private

  def render_error
    render json: { errors: @data_station.errors.full_messages },
      status: :unprocessable_entity
  end
end
