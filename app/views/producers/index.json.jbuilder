json.array!(@producers) do |producer|
  json.extract! producer, :id, :user_name, :full_name, :re_system_type, :init_kwh_reading
  json.url producer_url(producer, format: :json)
end
