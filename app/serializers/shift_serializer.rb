class ShiftSerializer
  def initialize(shift)
    @shift = shift
  end

  def to_json
    Oj.dump(to_h)
  end

  def to_h
    {
      id: shift.uuid,
      start_date: shift.start_date.to_s(:default_date),
      start_time: shift.start_time.to_s(:default_datetime),
      end_time: shift.end_time.to_s(:default_datetime),
      staff_required: shift.staff_required,
      job_type: shift.job_type
    }.stringify_keys
  end

  private

  attr_reader :shift
end
