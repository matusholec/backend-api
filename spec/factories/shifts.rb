FactoryBot.define do
  factory :shift do
    start_date { Date.today.advance(days: 4) }
    start_time { start_date.noon }
    end_time { start_time + 4.hours }
    staff_required { rand(1..4) }
    job_type { 'Barista' }
    uuid { SecureRandom.uuid }
  end
end

# == Schema Information
#
# Table name: shifts
#
#  id             :integer          not null, primary key
#  start_date     :date
#  start_time     :datetime
#  end_time       :datetime
#  staff_required :integer
#  job_type       :string
#  uuid           :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
