class DriftValue < ActiveRecord::Base
    establish_connection :external_new
    self.table_name = "drift.spotter_general"
    belongs_to :drift_buoy
end