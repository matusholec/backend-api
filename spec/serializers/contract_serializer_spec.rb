require 'rails_helper'

describe ContractSerializer do
  let!(:shift) { create(:shift) }
  let(:contract) { create(:contract, shift: shift) }

  subject { described_class.new(contract) }

  describe '.to_h' do
    it 'serializes contract into hash' do
      serialized_contract = subject.to_h
      expect(serialized_contract['candidate_name']).to eq(contract.candidate_name)
      expect(serialized_contract['id']).to eq(contract.uuid)
      expect(serialized_contract['shift_id']).to eq(contract.shift_uuid)
    end
  end

  describe '.to_json' do
    it 'serializes contract into json' do
      serialized_contract = subject.to_json
      expect(JSON.parse(serialized_contract)['candidate_name']).to eq(contract.candidate_name)
      expect(JSON.parse(serialized_contract)['id']).to eq(contract.uuid)
      expect(JSON.parse(serialized_contract)['shift_id']).to eq(contract.shift_uuid)
    end
  end
end
