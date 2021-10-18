class Station < ActiveRecord::Base
  establish_connection :external_oceanoobs
  has_many :data_stations
end
