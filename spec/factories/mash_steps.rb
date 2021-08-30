# frozen_string_literal: true

# == Schema Information
#
# Table name: mash_steps
#
#  id              :bigint           not null, primary key
#  duration        :integer          not null
#  temperature     :integer          not null
#  brew_session_id :bigint           not null
#
# Indexes
#
#  index_mash_steps_on_brew_session_id  (brew_session_id)
#
# Foreign Keys
#
#  fk_rails_...  (brew_session_id => brew_sessions.id)
#
FactoryBot.define do
  factory :mash_step do
    duration { 60 }
    temperature { 55 }
  end
end
