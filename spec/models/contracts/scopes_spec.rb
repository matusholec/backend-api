require 'rails_helper'

describe Contracts::Scopes do
  describe '.for_shift_uuid' do
    let!(:shift1) { create(:shift) }
    let!(:shift2) { create(:shift) }
    let!(:contracts_shift_1) { create_list(:contract, 4, shift_uuid: shift1.uuid) }
    let!(:contracts_shift_2) { create_list(:contract, 3, shift_uuid: shift2.uuid) }

    it 'gets conctracts for respective shifts' do
      expect(Contract.for_shift_uuid(shift1.uuid)).to match_array(contracts_shift_1)
      expect(Contract.for_shift_uuid(shift2.uuid)).to match_array(contracts_shift_2)
    end
  end
end
