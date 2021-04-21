class Wave < ApplicationRecord
  establish_connection :external_raw
  self.table_name = "bmo_triaxys"
  belongs_to :buoy
end
