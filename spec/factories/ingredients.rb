# frozen_string_literal: true

# == Schema Information
#
# Table name: ingredients
#
#  id              :bigint           not null, primary key
#  image_url       :string
#  title           :string           not null
#  weight          :float
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  brew_session_id :bigint           not null
#
# Indexes
#
#  index_ingredients_on_brew_session_id  (brew_session_id)
#
# Foreign Keys
#
#  fk_rails_...  (brew_session_id => brew_sessions.id)
#
FactoryBot.define do
  factory :ingredient do
    title { 'MyString' }
    weight { 1.5 }
    image_url { 'MyString' }
    brew_session { nil }
  end
end
