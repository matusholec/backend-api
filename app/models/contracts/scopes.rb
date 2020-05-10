module Contracts
  module Scopes
    def for_shift_uuid(shift_uuid)
      where(shift_uuid: shift_uuid)
    end
  end
end
