require 'rails_helper'

describe Api::ContractsController do
  describe 'GET #index' do
    def make_request
      get(api_contracts_url, params: params)
    end

    def serialized_contracts(contracts)
      contracts.map { |contract| ContractSerializer.new(contract).to_h.stringify_keys }
    end

    context 'no params specified' do
      let(:params) { {} }
      let!(:contracts) { create_list(:contract, 3) }

      it 'fetches all the contracts' do
        make_request
        expect(json_response.length).to eq(3)
        expect(json_response).to eq(serialized_contracts(contracts))
      end
    end

    context 'with shift_uuid specified' do
      let(:params) { { shift_id: shift.uuid } }
      let(:shift) { create(:shift) }
      let!(:contract) { create(:contract, shift_uuid: shift.uuid) }
      let!(:other_contract) { create(:contract) }

      it 'gets contracts for specified shift' do
        make_request
        expect(json_response.length).to eq(1)
        expect(json_response).to eq(serialized_contracts([contract]))
      end
    end
  end
end
