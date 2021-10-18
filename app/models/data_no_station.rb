class DataNoStation < ActiveRecord::Base
  establish_connection :external_oceanoobs
end
