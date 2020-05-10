module Contracts
  class Creator
    def initialize(params)
      @params = params
    end

    def call
      Contract.create!(params.merge(uuid: generated_uuid))
    end

    private

    attr_reader :params

    def generated_uuid
      loop do
        uuid = SecureRandom.uuid
        break uuid if Shift.where(uuid: uuid).none?
      end
    end
  end
end
