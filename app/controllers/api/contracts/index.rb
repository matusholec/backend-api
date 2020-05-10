module Api
  module Contracts
    class Index < ::Api::ControllerAction
      def call
        render json: Oj.dump(serialized_contracts)
      end

      private

      def serialized_contracts
        contracts.map do |contract|
          ::ContractSerializer.new(contract).to_h
        end
      end

      def contracts
        ::FilteredContracts.new(safe_params).call
      end

      def safe_params
        params.permit(:shift_id, :page, :per_page)
      end
    end
  end
end
