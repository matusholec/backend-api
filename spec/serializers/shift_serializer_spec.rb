require 'rails_helper'

describe ShiftSerializer do
  let!(:shift) { create(:shift) }

  subject { described_class.new(shift) }

  describe '.to_h' do
    it 'serializes shift into hash' do
      serialized_shift = subject.to_h
      expect(serialized_shift['start_date']).to eq(shift.start_date.to_s(:default_date))
      expect(serialized_shift['id']).to eq(shift.uuid)
      expect(serialized_shift['start_time']).to eq(shift.start_time.to_s(:default_datetime))
      expect(serialized_shift['staff_required']).to eq(shift.staff_required)
    end
  end

  describe '.to_json' do
    it 'serializes shift into json' do
      serialized_shift = subject.to_json
      expect(JSON.parse(serialized_shift)['start_date']).to eq(shift.start_date.to_s(:default_date))
      expect(JSON.parse(serialized_shift)['id']).to eq(shift.uuid)
      expect(JSON.parse(serialized_shift)['start_time']).to eq(shift.start_time.to_s(:default_datetime))
      expect(JSON.parse(serialized_shift)['staff_required']).to eq(shift.staff_required)
    end
  end
end
