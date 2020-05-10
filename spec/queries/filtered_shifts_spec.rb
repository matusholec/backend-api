require 'rails_helper'

describe FilteredShifts do
  let(:start_date) { Date.today }
  let(:job_type) { 'Barista' }
  let(:other_job_type) { 'Security' }
  let!(:shift1) { create(:shift, start_date: start_date, job_type: job_type) }
  let!(:shift2) { create(:shift, start_date: start_date.advance(days: 3), job_type: job_type) }
  let!(:shift3) { create(:shift, start_date: start_date, job_type: other_job_type) }

  subject { described_class.new(params) }

  describe '.call' do
    context 'with start_date specified' do
      let(:params) { { start_date: start_date } }

      it 'gets shifts for specified start_date' do
        expect(subject.call).to match_array([shift1, shift3])
      end
    end

    context 'with job_type specified' do
      let(:params) { { job_type: job_type } }

      it 'gets shifts for specified job_type' do
        expect(subject.call).to match_array([shift1, shift2])
      end
    end

    context 'with combination of job_type and start_date' do
      let(:params) { { start_date: start_date, job_type: job_type } }

      it 'gets correct shifts' do
        expect(subject.call).to match_array(shift1)
      end
    end

    context 'with non-existing combination of start_date and job_type' do
      let(:params) { { start_date: start_date.advance(days: 1), job_type: 'some job type' } }

      it 'gets no shifts' do
        expect(subject.call).to be_empty
      end
    end

    context 'with no params specified' do
      let(:params) { { } }

      it 'gets all the shifts' do
        expect(subject.call).to match_array([shift1, shift2, shift3])
      end
    end
  end
end
