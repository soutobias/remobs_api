class Api::V1::BuoysController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [ :index, :show ]
  before_action :set_buoy, only: [ :show ]

  def index
    @buoys = policy_scope(Buoy)
  end

  def show
  end

  private

  def set_buoy
    @buoy = Buoy.find(params[:id])
    authorize @buoy  # For Pundit
  end

  def buoy_params
    params.require(:buoy).permit(:name_buoy, :model)
  end

  def render_error
    render json: { errors: @buoy.errors.full_messages },
      status: :unprocessable_entity
  end

end
