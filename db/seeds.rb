(1..6).to_a.each do |n|
  start_date = Time.now + n.days
  start_time = start_date.at_beginning_of_hour
  end_time = start_time + 4.hours
  contract_numbers = n - 1

  shift = Shifts::Creator.new(
    start_date: start_date,
    start_time: start_time,
    end_time: end_time,
    staff_required: n,
    job_type: Shift::JOB_TYPES[n % Shift::JOB_TYPES.length]
  ).call

  (0).upto(contract_numbers) do
    Contracts::Creator.new(shift_uuid: shift.uuid, candidate_name: Faker::Name.name).call
  end
end
