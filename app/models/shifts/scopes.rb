module Shifts
  module Scopes
    def for_job_type(job_type)
      where(job_type: job_type)
    end

    def for_start_date(start_date)
      where(start_date: start_date)
    end
  end
end
