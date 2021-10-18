class Api::V1::DataStationsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [ :index ]

  def index
    if params[:token].present?
      user = User.where("authentication_token = ?", params[:token])
      unless user.empty?
        @query = ""
        if params[:start_date].present?
          @query += "date_time >= '#{params[:start_date]}' AND "
        end
        if params[:end_date].present?
          @query += "date_time <= '#{params[:end_date]}'"
        end
        if params[:station_id].present?
          @query += "AND station_id = #{params[:station_id]}"
        end
        # if params[:data_type].present?
        #   @query += "AND data_type = #{params[:data_type]}"
        # end
        # if params[:institution].present?
        #   @query += "AND institution = #{params[:institution]}"
        # end
        if @query.downcase.include? 'drop'
          @data_stations = []
        else
          @data_stations = policy_scope(DataStation).where(@query)
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
