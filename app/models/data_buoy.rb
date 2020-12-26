class DataBuoy < ActiveRecord::Base
  establish_connection :external
  belongs_to :buoy
end
