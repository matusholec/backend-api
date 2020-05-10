class FilteredShifts
  def initialize(params)
    @job_type = params[:job_type]
    @start_date = params[:start_date]&.to_date
    @per_page = params[:per_page].presence || 50
    @page = params[:page].presence || 1
  end

  def call(params = {})
    Shift.all
      .then(&method(:by_job_type))
      .then(&method(:by_start_date))
      .limit(per_page)
      .offset(offset)
  end

  private

  attr_reader :job_type, :start_date, :page, :per_page

  def by_job_type(shifts)
    return shifts unless job_type

    shifts.for_job_type(job_type)
  end

  def by_start_date(shifts)
    return shifts unless start_date

    shifts.for_start_date(start_date)
  end

  def offset
    per_page * (page.zero? ? 0 : page - 1)
  end
end
