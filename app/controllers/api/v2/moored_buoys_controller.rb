class Api::V2::MooredBuoysController < Api::V1::BaseController
    acts_as_token_authentication_handler_for User, except: [ :index, :show ]
    before_action :set_buoy, only: [ :show ]

    def index
        @moored_buoys = policy_scope(MooredBuoy)
        puts(@moored_buoys)
    end

    def show
    end

    private

    def set_buoy
        @moored_buoy = MooredBuoy.find(params[:buoy_id])
        authorize @moored_buoy  # For Pundit
    end

    def buoy_params
        params.require(:moored_buoy).permit(:buoy_id, :hull_id, :name, :deploy_date, :last_date_time, :latitude, :longitude, :geom, :status, :mode, :watch_circle_distance, :wmo_number, :antenna_id, :open_data, :link_site_pnboia, :metarea_section, :project_id)
    end

    def render_error
        render json: { errors: @moored_buoy.errors.full_messages },
        status: :unprocessable_entity
    end  
end
  