class Buoy < ActiveRecord::Base
  establish_connection :external
  has_many :data_buoys
end
