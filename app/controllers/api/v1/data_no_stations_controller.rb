class Api::V1::DataNoStationsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [ :index ]

  def index
    if params[:token].present?
      user = User.where("authentication_token = ?", params[:token])
      unless user.empty?
        @query = ""
        if params[:start_date].present?
          start_date = Date.strptime(params[:start_date])
          if (start_date >= Date.today+1 || start_date <= Date.today-5)
            start_date = Date.today.to_s
          end
          @query += "date_time >= '#{start_date.to_s}' AND "
        else
          @query += "date_time >= '#{Date.today.to_s}' AND "
        end

        if params[:end_date].present?
          end_date = Date.strptime(params[:end_date])
          if end_date <= Date.today-5
            end_date = Date.today+1
          end
          @query += "date_time <= '#{end_date.to_s}'"
        else
          @query += "date_time <= '#{(Date.today+1).to_s}'"
        end

        if params[:min_lat].present?
          @query += "AND lat >= #{params[:min_lat]}"
        end

        if params[:min_lon].present?
          @query += "AND lon >= #{params[:min_lon]}"
        end

        if params[:max_lat].present?
          @query += "AND lat <= #{params[:max_lat]}"
        end

        if params[:max_lon].present?
          @query += "AND lon <= #{params[:max_lon]}"
        end

        if params[:institution].present?
          @query += "AND institution = '#{params[:institution]}'"
        end

        if params[:data_type].present?
          @query += "AND data_type = '#{params[:data_type]}'"
        end

        if @query.downcase.include? 'drop'
          @data_no_stations = []
        else
          @data_no_stations = policy_scope(DataNoStation).where(@query)
        end

      end
    end
  end

  private

  def render_error
    render json: { errors: @data_no_station.errors.full_messages },
      status: :unprocessable_entity
  end
end
