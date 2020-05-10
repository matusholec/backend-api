module Api
  module Shifts
    class Index < ::Api::ControllerAction
      def call
        render json: Oj.dump(serialized_shifts)
      end

      private

      def serialized_shifts
        shifts.map do |shift|
          ::ShiftSerializer.new(shift).to_h
        end
      end

      def shifts
        ::FilteredShifts.new(safe_params).call
      end

      def safe_params
        params.permit(:job_type, :start_date, :page, :per_page)
      end
    end
  end
end
