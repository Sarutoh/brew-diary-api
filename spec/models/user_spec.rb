# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                              :bigint           not null, primary key
#  authentication_token            :text
#  authentication_token_created_at :datetime
#  email                           :string           default(""), not null
#  encrypted_password              :string           default(""), not null
#  remember_created_at             :datetime
#  reset_password_sent_at          :datetime
#  reset_password_token            :string
#  created_at                      :datetime         not null
#  updated_at                      :datetime         not null
#
# Indexes
#
#  index_users_on_authentication_token  (authentication_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
RSpec.describe User do
  describe 'callbacks' do
    it 'creates an auth token before saving if one does not exist' do
      user = described_class.new(attributes_for(:user))
      expect(user.authentication_token).to be_blank

      user.save

      expect(user.reload.authentication_token).not_to be_blank
    end
  end
end
