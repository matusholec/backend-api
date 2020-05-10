require 'rails_helper'

describe Api::ShiftsController do
  describe 'GET #index' do
    def make_request
      get(api_shifts_url, params: params)
    end

    def serialized_shifts(shifts)
      shifts.map { |shift| ShiftSerializer.new(shift).to_h.stringify_keys }
    end

    context 'no params specified' do
      let(:params) { {} }
      let!(:shifts) { create_list(:shift, 4) }

      it 'fetches all the shifts' do
        make_request
        expect(json_response.length).to eq 4
        expect(json_response).to eq(serialized_shifts(shifts))
      end
    end

    context 'with start_date in params' do
      let(:start_date) { Date.today.advance(days: 3) }
      let(:params) { { start_date: start_date } }
      let!(:shift_on_start_date) { create(:shift, start_date: start_date) }
      let!(:second_shift_on_start_date) { create(:shift, start_date: start_date) }
      let!(:shift_before_start_date) { create(:shift, start_time: start_date.advance(days: -2)) }

      it 'fetches all the shifts on start_date' do
        make_request
        expect(json_response.length).to eq 2
        expect(json_response).to eq(serialized_shifts([shift_on_start_date, second_shift_on_start_date]))
      end
    end

    context 'with job_type in params' do
      let(:job_type) { 'Receptionist' }
      let(:params) { { job_type: job_type } }
      let!(:shift_receptionist) { create(:shift, job_type: job_type) }
      let!(:shift_not_receptionist) { create(:shift, job_type: 'Security') }

      it 'fetches Receptionist shift' do
        make_request
        expect(json_response.length).to eq 1
        expect(json_response).to eq(serialized_shifts([shift_receptionist]))
      end
    end

    context 'with start_time and job_type parameter' do
      let(:job_type) { 'Receptionist' }
      let(:start_date) { Date.today.advance(days: 3) }
      let(:params) { { start_date: start_date, job_type: job_type } }
      let!(:shift_receptionist_not_on_start_date) { create(:shift, job_type: job_type, start_date: start_date.advance(days: 3)) }
      let!(:shift_receptionist_on_start_date) { create(:shift, job_type: job_type, start_date: start_date) }
      let!(:another_shift_receptionist_on_start_date) { create(:shift, job_type: job_type, start_date: start_date) }
      let!(:other_shift) { create(:shift, job_type: 'Barista', start_date: start_date.advance(days: 2)) }

      it 'fetches only security job that start after start_time parameter' do
        make_request
        expect(json_response.length).to eq 2
        expect(json_response).to eq(serialized_shifts([shift_receptionist_on_start_date, another_shift_receptionist_on_start_date]))
      end
    end
  end
end
