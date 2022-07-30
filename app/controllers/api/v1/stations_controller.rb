class Api::V1::StationsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [ :index, :show ]
  before_action :set_station, only: [ :show ]

  def index
    @stations = policy_scope(Station)
  end

  def show
  end
  
  private
  

  def set_station
    @station = Station.find(params[:id])
    authorize @station  # For Pundit
  end

  def station_params
    params.require(:station).permit(:id, :name, :lat, :lon, :data_type, :institution, :url, :flag)
  end

  def render_error
    render json: { errors: @buoy.errors.full_messages },
      status: :unprocessable_entity
  end

end
