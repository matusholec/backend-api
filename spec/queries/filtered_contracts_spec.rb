require 'rails_helper'

describe FilteredContracts do
  describe '.call' do
    let!(:shift1) { create(:shift) }
    let!(:shift2) { create(:shift) }
    let!(:contracts_shift_1) { create_list(:contract, 4, shift_uuid: shift1.uuid) }
    let!(:contracts_shift_2) { create_list(:contract, 75, shift_uuid: shift2.uuid) }

    subject { described_class.new(params) }
    context 'with shift_id specified as shift1' do
      let(:params) { { shift_id: shift1.uuid } }

      it 'gets all filtered contracts for shift1' do
        expect(subject.call).to match_array(contracts_shift_1)
      end
    end

    context 'with shift_id specified as shift2' do
      let(:params) { { shift_id: shift2.uuid, per_page: 30 } }

      it 'gets paginated filtered contracts for shift2' do
        expect(subject.call).to match_array(contracts_shift_2.first(30))
      end
    end

    context 'without shift_id specified' do
      let(:params) { { per_page: 100 } }

      it 'gets all the contracts' do
        expect(subject.call).to match_array(contracts_shift_1 + contracts_shift_2)
      end
    end
  end
end
