class Shift < ApplicationRecord
  extend Shifts::Scopes

  validates :start_date, :start_time, :end_time, :staff_required, presence: true
  validate :correct_end_time

  has_many :contracts, class_name: 'Contract', foreign_key: 'shift_uuid', primary_key: 'uuid'

  JOB_TYPES = ['Security', 'Receptionist', 'Barista', 'Retail store shift', 'Waiting staff']

  private

  def correct_end_time
    return if end_time.nil? || start_time.nil?
    if end_time < start_time
      errors.add(:end_time, 'has to be later than the start time')
    end
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
