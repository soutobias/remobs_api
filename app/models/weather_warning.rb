class WeatherWarning < ActiveRecord::Base
    establish_connection :external_oceanoobs
    self.table_name = "warnings"
end