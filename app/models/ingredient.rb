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
class Ingredient < ApplicationRecord
  belongs_to :brew_session
end
