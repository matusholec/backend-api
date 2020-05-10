FactoryBot.define do
  factory :contract do
    shift
    candidate_name { Faker::Name.name }
    uuid { SecureRandom.uuid }
  end
end

# == Schema Information
#
# Table name: contracts
#
#  id             :integer          not null, primary key
#  shift_uuid     :string           not null
#  candidate_name :string           not null
#  uuid           :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
