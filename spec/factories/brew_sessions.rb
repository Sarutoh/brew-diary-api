# frozen_string_literal: true

# == Schema Information
#
# Table name: brew_sessions
#
#  id          :bigint           not null, primary key
#  description :text
#  image_url   :string
#  title       :string           not null
#  volume      :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_brew_sessions_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :brew_session do
    title { Faker::Beer.name }
    description { Faker::Lorem.sentence(word_count: 6) }
    image_url { Faker::Internet.url }
    volume { 25 }

    association :user
  end
end
