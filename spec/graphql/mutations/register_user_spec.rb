# frozen_string_literal: true

RSpec.describe Mutations::RegisterUser, type: :request do
  subject { post '/graphql', params: { query: mutation } }

  let(:email) { 'kleinjm007@gmail.com' }
  let(:password) { 'testing123' }

  let(:user_variables) { { email: email, password: 'wrongpass1' } }

  context 'create new user' do
    it do
      expect { subject }.to change(User, :count).by(1)

      json = JSON.parse(response.body)
      data = json['data']['registerUser']

      expect(data).to include('user' => { 'id' => be_present, 'authenticationToken' => be_present })
    end
  end

  context 'raises error for incorrect email/password' do
    let(:error) do
      I18n.t('mutations.invalid_attributes', class_name: User.name, messages: 'Email has already been taken')
    end

    it do
      create(:user, user_variables)

      expect { subject }.not_to change(User, :count)

      json = JSON.parse(response.body)
      data = json['data']['registerUser']

      expect(json['errors'][0]['message']).to eq(error)
      expect(data).to be_blank
    end
  end

  def mutation
    <<~GQL
      mutation {
        registerUser(input: { email: "#{email}", password: "#{password}" }) {
          user {
            id
            authenticationToken
          }
        }
      }
    GQL
  end
end
