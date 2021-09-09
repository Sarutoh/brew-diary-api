# frozen_string_literal: true

# == Schema Information
#
# Table name: brew_sessions
#
#  id          :bigint           not null, primary key
#  description :text
#  image_url   :string
#  status      :string           default("initialized"), not null
#  title       :string           not null
#  volume      :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_brew_sessions_on_status   (status)
#  index_brew_sessions_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class BrewSession < ApplicationRecord
  belongs_to :user

  has_many :ingredients
  has_many :mash_steps, dependent: :destroy
  has_many :hops

  enum status: {
    initialized: 'initialized',
    in_progress: 'in_progress',
    finished: 'finished'
  }, _prefix: :status
end
