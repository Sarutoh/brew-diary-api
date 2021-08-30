# frozen_string_literal: true

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
