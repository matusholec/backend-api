require 'rails_helper'

describe Contracts::Creator do
  let!(:shift) { create(:shift) }
  let(:params) do
    {
      shift_uuid: shift.uuid,
      candidate_name: Faker::Name.name
    }
  end

  subject { described_class.new(params) }

  describe '.call' do
    it 'creates the contract' do
      expect{ subject.call }.to change { Contract.count }.from(0).to(1)
      contract = Contract.last
      expect(contract.candidate_name).to eq(params[:candidate_name])
      expect(contract.shift).to eq(shift)
      expect(contract.uuid).not_to be_nil
    end
  end
end
