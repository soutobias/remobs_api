class Api::V1::DataStationsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [ :index ]

  def index
    if params[:token].present?
      user = User.where("authentication_token = ?", params[:token])
      unless user.empty?
        @query = ""
        if params[:start_date].present?
          start_date = Date.strptime(params[:start_date])
          if (start_date >= Date.today+1 || start_date <= Date.today-5)
            start_date = Date.today.to_s
          end
          @query += "date_time >= '#{start_date.to_s}' AND "
        else
          @query += "date_time >= '#{Date.today.to_s}' AND "
        end

        if params[:end_date].present?
          end_date = Date.strptime(params[:end_date])
          if end_date <= Date.today-5
            end_date = Date.today+1
          end
          @query += "date_time <= '#{end_date.to_s}'"
        else
          @query += "date_time <= '#{(Date.today+1).to_s}'"
        end

        if params[:station_id].present?
          @query += "AND station_id = #{params[:station_id]}"
        end
        if params[:min_lat].present?
          @query += "AND lat >= #{params[:lat]}"
        end
        if params[:min_lon].present?
          @query += "AND lon >= #{params[:lon]}"
        end
        if params[:max_lat].present?
          @query += "AND lat <= #{params[:lat]}"
        end
        if params[:max_lon].present?
          @query += "AND lon <= #{params[:lon]}"
        end

        @joins = ''
        if params[:data_type].present? || params[:institution].present?
          @joins = "INNER JOIN stations on stations.id = data_stations.station_id"
          if params[:data_type].present?
            @joins += " AND stations.data_type = '#{params[:data_type]}'"
          end
          if params[:institution].present?
            @joins += " AND stations.institution = '#{params[:institution]}'"
          end
            @data_stations=[]
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
