class Contract < ApplicationRecord
  extend Contracts::Scopes

  belongs_to :shift, class_name: 'Shift', foreign_key: 'shift_uuid', primary_key: 'uuid'

  validates :shift_uuid, :candidate_name, presence: true
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
