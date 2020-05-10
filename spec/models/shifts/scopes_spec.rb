require 'rails_helper'

describe Shifts::Scopes do
  let(:start_date) { Date.today }
  let(:job_type) { 'Barista' }
  let(:other_job_type) { 'Security' }
  let!(:shift1) { create(:shift, start_date: start_date, job_type: job_type) }
  let!(:shift2) { create(:shift, start_date: start_date.advance(days: 3), job_type: job_type) }
  let!(:shift3) { create(:shift, start_date: start_date, job_type: other_job_type) }

  describe '.for_job_type' do
    it 'gets shifts for specified job_type' do
      expect(Shift.for_job_type(job_type)).to match_array([shift1, shift2])
      expect(Shift.for_job_type(other_job_type)).to match_array([shift3])
    end
  end

  describe '.for_start_date' do
    it 'gets shifts for specified start_date' do
      expect(Shift.for_start_date(start_date)).to match_array([shift1, shift3])
    end
  end
end
