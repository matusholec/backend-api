require 'rails_helper'

describe Shift do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:start_date)  }
    it { is_expected.to validate_presence_of(:staff_required) }
    it { is_expected.to validate_presence_of(:start_time) }
    it { is_expected.to validate_presence_of(:end_time) }

    it 'validates that end time is after start time' do
      shift = FactoryBot.build(:shift)
      shift.start_time = shift.end_time.advance(hours: 8)
      expect(shift).not_to be_valid
    end
  end
end
