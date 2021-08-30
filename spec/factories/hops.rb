# frozen_string_literal: true

# == Schema Information
#
# Table name: hops
#
#  id              :bigint           not null, primary key
#  title           :string
#  weight          :float
#  brew_session_id :bigint
#
# Indexes
#
#  index_hops_on_brew_session_id  (brew_session_id)
#
FactoryBot.define do
  factory :hop do
    title { Faker::Beer.hop }
    weight { 10.0 }
  end
end
