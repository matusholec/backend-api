require 'rails_helper'

describe Shifts::Creator do
  let(:params) do
    {
      start_date: Date.today,
      start_time: Date.today.noon,
      end_time: Date.today.noon.advance(hours: 5),
      staff_required: 4,
      job_type: 'Receptionist',
    }
  end

  subject { described_class.new(params) }

  describe '.call' do
    it 'creates the shift' do
      expect{ subject.call }.to change { Shift.count }.from(0).to(1)
      shift = Shift.last
      expect(shift.start_date).to eq(params[:start_date])
      expect(shift.start_time).to eq(params[:start_time])
      expect(shift.end_time).to eq(params[:end_time])
      expect(shift.staff_required).to eq(params[:staff_required])
      expect(shift.job_type).to eq(params[:job_type])
      expect(shift.uuid).not_to be_nil
    end
  end
end
