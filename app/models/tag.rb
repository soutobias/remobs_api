class Tag < ActiveRecord::Base
  establish_connection :external_raw
  self.table_name = "tag_location"
  self.primary_key = 'id'
end
