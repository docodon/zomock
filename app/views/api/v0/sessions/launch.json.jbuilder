json.status true
json.location_details do 
	json.entity_type        @location.entity_type
	json.entity_id			@location.entity_id
	json.title				@location.title
	json.latitude			@location.latitude.to_s
	json.longitude			@location.longitude.to_s
	json.city_id			@location.city_id
	json.city_name			@location.city_name
	json.country_id			@location.country_id
	json.country_name		@location.country_name
end