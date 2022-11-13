class Api::V2::DriftBuoysController < Api::V1::BaseController
    acts_as_token_authentication_handler_for User, except: [ :index, :show ]
    before_action :set_buoy, only: [ :show ]

    def index
        @drift_buoys = policy_scope(DriftBuoy)
        puts(@drift_buoys)
    end

    def show
    end

    private

    def set_buoy
        @drift_buoy = DriftBuoy.find(params[:buoy_id])
        authorize @drift_buoy  # For Pundit
    end

    def buoy_params
        params.require(:drift_buoy).permit(:buoy_id, :hull_id, :model, :latitude_deploy, :longitude_deploy, :deploy_date, :last_date_time, :last_latitude, :last_longitude, :geom_deploy, :geom_last_position, :project_id, :antenna_id)
    end
    
    def render_error
        render json: { errors: @drift_buoy.errors.full_messages },
        status: :unprocessable_entity
    end  
end
  