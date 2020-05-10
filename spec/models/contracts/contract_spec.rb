require 'rails_helper'

describe Contract do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:shift_uuid) }
    it { is_expected.to validate_presence_of(:candidate_name) }
  end
end
