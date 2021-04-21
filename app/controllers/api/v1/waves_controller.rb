class Api::V1::WavesController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [ :index ]

  def index
    if params[:token].present? && params[:buoy].present?
      user = User.where("authentication_token = ?", params[:token])
      buoy = Buoy.where("id = ?", params[:buoy])
      unless user.empty?
        unless buoy.empty?
          @query = ""
          if params[:start_date].present?
            @query += "date_time >= '#{params[:start_date]}' AND "
          end
          if params[:end_date].present?
            @query += "date_time <= '#{params[:end_date]}' AND "
          end
          @query += "buoy_id = #{params[:buoy]}"
          if @query.downcase.include? 'drop'
            @waves = []
          else
            @waves = policy_scope(Wave).where(@query)
          end
        end
      end
    end
  end

  def show
    @wave = Wave.where("id = params[:id]")
    authorize @wave  # For Pundit
  end

  private

  def render_error
    render json: { errors: @wave.errors.full_messages },
      status: :unprocessable_entity
  end
end