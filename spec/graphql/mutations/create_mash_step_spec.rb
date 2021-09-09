# frozen_string_literal: true

RSpec.describe Mutations::CreateMashStep, type: :request do
  subject { post '/graphql', params: { query: mutation, context: current_user } }

  let(:current_user) { create(:user) }
  let(:brew_session) { create(:brew_session, user: current_user) }
  let(:duration) { 60 }

  describe '.resolve' do
    context 'when success' do
      it 'creates a mash step' do
        sign_in(current_user)

        expect { subject }.to change(MashStep, :count).by(1)
        expect(brew_session.mash_steps.count).to eq(1)
      end
    end

    context 'when unauthenticated' do
      it 'returns an authenticate error' do
        expect { subject }.not_to change(MashStep, :count)

        json = JSON.parse(response.body)
        data = json['data']['createMashStep']

        expect(json['errors'][0]['message']).to eq(I18n.t('mutations.unauthenticated'))
        expect(data).to be_blank
      end
    end

    context 'when unauthorized' do
      let(:brew_session) { create(:brew_session) }

      it 'returns not authorized error' do
        sign_in(current_user)

        expect { subject }.not_to change(MashStep, :count)

        json = JSON.parse(response.body)
        data = json['data']['createMashStep']

        expect(json['errors'][0]['message']).to eq(I18n.t('mutations.unauthorized'))
        expect(data).to be_blank
      end
    end

    context 'when invalid' do
      let(:duration) { 'fgd' }
      let(:error) do
        "Argument 'duration' on InputObject 'CreateMashStepInput' has an invalid value (fgd). Expected type 'Int!'."
      end

      it 'returns an validation error' do
        sign_in(current_user)

        expect { subject }.not_to change(MashStep, :count)

        json = JSON.parse(response.body)

        expect(json['errors'][0]['message']).to eq(error)
      end
    end
  end

  def mutation
    <<~GQL
      mutation {
        createMashStep(input: { temperature: 65, duration: #{duration}, brewSessionId: #{brew_session.id}} ) {
          mashStep {
            id
            temperature
            duration
          }
        }
      }
    GQL
  end
end
