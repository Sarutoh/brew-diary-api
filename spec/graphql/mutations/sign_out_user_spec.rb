# frozen_string_literal: true

RSpec.describe Mutations::SignOutUser, type: :request do
  subject { post '/graphql', params: { query: mutation, context: user } }

  let(:user) { create(:user, authentication_token: authentication_token) }
  let(:authentication_token) { 'M93j9nP92BvVMKcSpxBb' }

  it 'signs out the current user' do
    sign_in(user)

    subject

    json = JSON.parse(response.body)

    expect(user.reload.authentication_token).not_to eq(authentication_token)
    expect(json['errors']).to be_blank
  end

  it 'raises error for user not signed in' do
    subject

    json = JSON.parse(response.body)
    data = json['data']['signOutUser']

    expect(json['errors'][0]['message']).to eq(I18n.t('mutations.not_signed_in'))
    expect(data).to be_blank
  end

  def mutation
    <<~GQL
      mutation {
        signOutUser(input: {}) {
          user {
            id
            authenticationToken
          }
        }
      }
    GQL
  end
end
