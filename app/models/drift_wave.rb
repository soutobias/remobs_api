class DriftValue < ActiveRecord::Base
    establish_connection :external_new
    self.table_name = "drift.spotter_waves"
    belongs_to :drift_buoy
end