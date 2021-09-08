# frozen_string_literal: true

RSpec.describe BrewSessions::MashStepPolicy do
  subject { described_class.new(record: brew_session, user: user).create? }

  let(:brew_session) { create(:brew_session) }

  describe '.create?' do
    context 'w/ allowed' do
      let(:user) { brew_session.user }

      it { is_expected.to be_truthy }
    end

    context 'w/ not allowed' do
      let(:user) { create(:user) }

      it { is_expected.to be_falsey }
    end
  end
end
