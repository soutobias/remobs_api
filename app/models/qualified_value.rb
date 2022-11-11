class QualifiedValue < ActiveRecord::Base
    establish_connection :external_new
    self.table_name = "qualified_data.qualified_data"
    belongs_to :moored_buoy
end