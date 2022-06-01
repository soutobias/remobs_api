class DataTide < ActiveRecord::Base
  establish_connection :external
  self.table_name = "data_buoys"
  belongs_to :buoy
end
