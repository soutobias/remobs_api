json.array! @moored_buoys do |moored_buoy|
    json.extract! moored_buoy, :buoy_id, :hull_id, :name, :deploy_date, :last_date_time, :latitude, :longitude, :geom, :status, :mode, :watch_circle_distance, :wmo_number, :antenna_id, :open_data, :link_site_pnboia, :metarea_section, :project_id
end
