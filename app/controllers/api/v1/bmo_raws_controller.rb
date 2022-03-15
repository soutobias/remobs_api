class Api::V1::BmoRawsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [ :index ]

  def index
    if params[:token].present?
      user = User.where("authentication_token = ?", params[:token])
      unless user.empty?
        @query = ""
        if params[:start_date].present?
          @query += "date_time >= '#{params[:start_date]}' AND "
        end
        if params[:end_date].present?
          @query += "date_time <= '#{params[:end_date]}'"
        end
        if @query.downcase.match(/(\/|;|drop|\*|if|\+|\-|\!|concat|char|union)/)
          @bmo_raws = []
        else
          @bmo_raws = policy_scope(BmoRaw).where(@query)
        end
      end
    end
  end

  private

  def render_error
    render json: { errors: @bmo_raw.errors.full_messages },
      status: :unprocessable_entity
  end
end
