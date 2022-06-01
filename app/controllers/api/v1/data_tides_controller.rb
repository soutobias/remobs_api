class Api::V1::DataTidesController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [ :index, :last ]

  def index
    if params[:token].present? && params[:buoy].present?
      user = User.where("authentication_token = ?", params[:token])
      buoy = Buoy.where("id = ?", params[:buoy])
      unless user.empty?
        unless buoy.empty?
          @query = ""
          if params[:start_date].present?
            start_date = Time.strptime(params[:start_date], format="%Y-%m-%d")
            if start_date >= Time.now.utc
              start_date = (Time.now.utc - (3600*24*1))
            end
            @query += "date_time >= '#{start_date.strftime("%Y-%m-%d %H:%M:%S")}' AND "
          else
            start_date = Time.now.utc - (3600*24*4)
            @query += "date_time >= '#{(Time.now.utc - (3600*24*5)).strftime("%Y-%m-%d %H:%M:%S")}' AND "
          end
          if params[:end_date].present?
            end_date = Time.strptime(params[:end_date], format="%Y-%m-%d")
            if end_date <= start_date
              end_date = start_date + (3600*24*1)
            elsif (end_date - start_date)/3600/24 > 5
              end_date = start_date + (3600*24*5)
            end
            @query += "date_time <= '#{end_date.strftime("%Y-%m-%d %H:%M:%S")}' AND "
          else
            @query += "date_time <= '#{(Time.now.utc + (3600*24*1)).strftime("%Y-%m-%d %H:%M:%S")}' AND "
          end

          @query += "buoy_id = #{params[:buoy]}"

          if !@query.downcase.match(/(\/|;|drop|\*|if|\+|\-\-|\!|concat|char|union)/).to_a.empty?
            @data_tides = []
          else
            puts(@query)
            if params[:limit].present?
              @data_tides = policy_scope(DataTide).where(@query).order(date_time: :desc).limit(params[:limit].to_i)
            else
              @data_tides = policy_scope(DataTide).where(@query).order(date_time: :desc)
            end
          end
        end
      end
    end
  end

  def show
    @data_tide = DataTide.where("id = params[:id]")
    authorize @data_tide  # For Pundit
  end

  private

  def render_error
    render json: { errors: @data_tide.errors.full_messages },
      status: :unprocessable_entity
  end
end
