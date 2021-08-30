# frozen_string_literal: true

RSpec.describe Mutations::CreateBrewSession, type: :request do
  subject { post '/graphql', params: { query: mutation, context: current_user } }

  let(:current_user) { create(:user) }
  let(:volume) { 25.0 }

  describe '.resolve' do
    context 'when success' do
      it 'creates a brew session' do
        sign_in(current_user)

        expect { subject }.to change(BrewSession, :count).by(1)
        expect(current_user.brew_sessions.count).to eq(1)
      end
    end

    context 'when anauthorized' do
      it 'returns an authenticate error' do
        expect { subject }.not_to change(BrewSession, :count)

        json = JSON.parse(response.body)
        data = json['data']['createBrewSession']

        expect(json['errors'][0]['message']).to eq('You need to authenticate to perform this action')
        expect(data).to be_blank
      end
    end

    context 'when invalid' do
      let(:volume) { 'fgd' }
      let(:error) do
        "Argument 'volume' on InputObject 'CreateBrewSessionInput' has an invalid value (fgd). Expected type 'Float!'."
      end

      it 'returns an validation error' do
        sign_in(current_user)

        expect { subject }.not_to change(BrewSession, :count)

        json = JSON.parse(response.body)

        expect(json['errors'][0]['message']).to eq(error)
      end
    end
  end

  def mutation
    <<~GQL
      mutation {
        createBrewSession(input: { title: "Tripwire", volume: #{volume}} ) {
          brewSession {
            id
            title
            volume
            user {
              id
            }
          }
        }
      }
    GQL
  end
end
