json.array!(@employees) do |employee|
  json.extract! employee, :id, :name, :phone, :email, :location_id
  json.url employee_url(employee, format: :json)
end
