json.array! @warnings do |weather_warning|
    json.extract! weather_warning, :date_time, :region, :warning_number, :institution, :warning_type, :start_date, :description, :end_date
end