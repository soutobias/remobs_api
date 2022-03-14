class Api::V1::DataBuoysController < Api::V1::BaseController
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
          if @query.downcase.include? 'drop'
            @data_buoys = []
          else
            puts(@query)
            @data_buoys = policy_scope(DataBuoy).where(@query).order(date_time: :desc)
          end
        end
      end
    end
  end

  def last
    if params[:token].present? && params[:buoy].present?
      user = User.where("authentication_token = ?", params[:token])
      buoy = Buoy.where("id = ?", params[:buoy])
      unless user.empty?
        unless buoy.empty?
          @query = ""
          start_date = Time.now.utc - (3600*24*4)
          @query += "date_time >= '#{(Time.now.utc - (3600*24*5)).strftime("%Y-%m-%d %H:%M:%S")}' AND "
          @query += "date_time <= '#{(Time.now.utc + (3600*24*1)).strftime("%Y-%m-%d %H:%M:%S")}' AND "
          @query += "buoy_id = #{params[:buoy]}"
          if @query.downcase.include? 'drop'
            @data_buoys = []
          else
            puts(@query)
            @data_buoys = policy_scope(DataBuoy).where(@query).order(date_time: :desc).limit(1)
          end
        end
      end
    end
  end

  def show
    @data_buoy = DataBuoy.where("id = params[:id]")
    authorize @data_buoy  # For Pundit
  end

  private

  def render_error
    render json: { errors: @data_buoy.errors.full_messages },
      status: :unprocessable_entity
  end
end
