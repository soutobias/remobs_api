class BmoRaw < ActiveRecord::Base
  establish_connection :external_raw
  self.table_name = "bmo_br"
  self.primary_key = 'id'
  belongs_to :buoy
end
