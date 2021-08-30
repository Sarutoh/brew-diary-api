# frozen_string_literal: true

# == Schema Information
#
# Table name: ingredients
#
#  id              :bigint           not null, primary key
#  image_url       :string
#  pieces          :integer
#  title           :string           not null
#  weight          :float
#  brew_session_id :bigint
#
# Indexes
#
#  index_ingredients_on_brew_session_id  (brew_session_id)
#
FactoryBot.define do
  factory :ingredient do
    title { 'Irish moss' }
    weight { 1.5 }
    image_url { Faker::Internet.url }
    brew_session { nil }
  end
end
