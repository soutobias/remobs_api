class Model < ActiveRecord::Base
  establish_connection :external_raw
  self.table_name = "models_remo"
  belongs_to :buoy
end
