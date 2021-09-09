# frozen_string_literal: true

RSpec.describe Mutations::SignInUser, type: :request do
  subject { post '/graphql', params: { query: mutation } }

  let(:email) { 'kleinjm007@gmail.com' }
  let(:password) { 'testing123' }

  let(:user_variables) { { email: email, password: 'wrongpass1' } }

  it 'signs in the user' do
    create(:user, email: email, password: password)

    subject

    json = JSON.parse(response.body)
    data = json['data']['signInUser']

    expect(data).to include('user' => { 'id' => be_present, 'authenticationToken' => be_present })
  end

  it 'raises error for incorrect email/password' do
    create(:user, user_variables)

    subject

    json = JSON.parse(response.body)
    data = json['data']['signInUser']

    expect(json['errors'][0]['message']).to eq(I18n.t('mutations.incorrect_values'))
    expect(data).to be_blank
  end

  it 'raises error for missing user' do
    subject

    json = JSON.parse(response.body)
    data = json['data']['signInUser']

    expect(json['errors'][0]['message']).to eq(I18n.t('mutations.not_registered'))
    expect(data).to be_blank
  end

  def mutation
    <<~GQL
      mutation {
        signInUser(input: { email: "#{email}", password: "#{password}" }) {
          user {
            id
            authenticationToken
          }
        }
      }
    GQL
  end
end
