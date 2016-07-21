json.array!(@timecards) do |timecard|
  json.extract! timecard, :id, :start, :end, :employee, :user_id, :regular, :overtime, :doubletime, :sick, :vacation, :holiday, :personal, :other
  json.url timecard_url(timecard, format: :json)
end
