json.array!(@fillups) do |fillup|
  json.extract! fillup, :id, :vehicle_id, :odometer, :fill_date, :gallons
  json.url fillup_url(fillup, format: :json)
  json.vehicle do
    json.id fillup.vehicle.id
    json.name fillup.vehicle.name
  end
end
