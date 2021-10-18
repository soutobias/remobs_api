class DataStation < ActiveRecord::Base
  establish_connection :external_oceanoobs
  belongs_to :station
end
