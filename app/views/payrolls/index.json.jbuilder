json.array!(@payrolls) do |payroll|
  json.extract! payroll, :id, :date, :date
  json.url payroll_url(payroll, format: :json)
end
