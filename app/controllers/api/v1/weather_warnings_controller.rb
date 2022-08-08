class Api::V1::WeatherWarningsController < Api::V1::BaseController
    acts_as_token_authentication_handler_for User, except: [ :index, :distinct ]
    after_action :verify_authorized, except: [ :distinct, :index ]

    def index
      if params[:token].present?
        user = User.where("authentication_token = ?", params[:token])
        unless user.empty?
          @query = ""
          if params[:start_date].present?
            start_date = Time.strptime(params[:start_date], format="%Y-%m-%dT%H:%M:%S")
            if (start_date >= Time.now.utc || start_date <= Time.now.utc - (3600*24*5))
              start_date = (Time.now.utc - (3600*24*1))
            end
            @query += "date_time >= '#{start_date.strftime("%Y-%m-%d %H:%M:%S")}' AND "
          else
            @query += "date_time >= '#{(Time.now.utc - (3600*24*5)).strftime("%Y-%m-%d %H:%M:%S")}' AND "
          end
          if params[:end_date].present?
            end_date = Time.strptime(params[:end_date], format="%Y-%m-%dT%H:%M:%S")
            if end_date <= Time.now.utc - (3600*24*5)
              end_date = Time.now.utc
            end
            @query += "date_time <= '#{end_date.strftime("%Y-%m-%d %H:%M:%S")}'"
          else
            @query += "date_time <= '#{(Time.now.utc).strftime("%Y-%m-%d %H:%M:%S")}'"
          end

          if params[:institution].present?
            @query += "AND institution = '#{params[:institution]}'"
          end
    
          if !@query.downcase.match(/(\/|;|drop|\*|if|\+|\-\-|\!|concat|char|union)/).to_a.empty?
            @warnings = []
          else
            if user[0].admin
              @warnings = policy_scope(WeatherWarning).where(@query)
            else
              @warnings = policy_scope(WeatherWarning).where(@query)
            end
          end
        end
      end
    end
  
    private
  
    def render_error
      render json: { errors: @warning.errors.full_messages },
        status: :unprocessable_entity
    end
  end
  