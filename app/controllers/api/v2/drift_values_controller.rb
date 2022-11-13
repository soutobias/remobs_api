class Api::V2::DriftValuesController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [ :index, :last ]
  skip_after_action :verify_policy_scoped, :only => :index
  
  def index
    if params[:token].present?
      user = User.where("authentication_token = ?", params[:token])
      unless user.empty?
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
          end
          @query += "date_time <= '#{end_date.strftime("%Y-%m-%d %H:%M:%S")}' AND "
        else
          @query += "date_time <= '#{(Time.now.utc + (3600*24*1)).strftime("%Y-%m-%d %H:%M:%S")}' AND "
        end
        @query += 'true'
        puts('---------------')
        puts(@query)
        puts('---------------')
        if !@query.downcase.match(/(\/|;|drop|\*|if|\+|\-\-|\!|concat|char|union)/).to_a.empty?
          @qualified_values = []
        else
          if params[:limit].present?
            @qualified_values = DriftValue.where(@query).order(date_time: :desc).limit(params[:limit].to_i)
          else
            @qualified_values = DriftValue.where(@query).order(date_time: :desc)
          end
        end
      end
    end
  end

  def show
    @qualified_value = DriftValue.where("id = params[:id]")
    authorize @qualified_value  # For Pundit
  end

  private

  def render_error
    render json: { errors: @qualified_value.errors.full_messages },
      status: :unprocessable_entity
  end
end
