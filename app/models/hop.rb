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
class Hop < ApplicationRecord
  belongs_to :brew_session
end
