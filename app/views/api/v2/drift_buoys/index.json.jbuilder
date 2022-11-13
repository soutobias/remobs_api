json.array! @drift_buoys do |drift_buoy|
    json.extract! drift_buoy, :buoy_id, :hull_id, :model, :latitude_deploy, :longitude_deploy, :deploy_date, :last_date_time, :last_latitude, :last_longitude, :geom_deploy, :geom_last_position, :project_id, :antenna_id
end
