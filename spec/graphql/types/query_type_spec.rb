# frozen_string_literal: true

RSpec.describe Types::QueryType, :feature do
  describe 'brew_sessions' do
    subject(:result) { BrewDiarySchema.execute(query).as_json }

    let!(:brew_sessions) { create_pair(:brew_session) }

    context 'return brewSessions list' do\
      let(:query) do
        %(query {
          brewSessions {
            title
          }
        })
      end

      it do
        expect(result.dig('data', 'brewSessions')).to match_array(
          brew_sessions.map { |bs| { 'title' => bs.title } }
        )
      end
    end

    context 'return hops list' do
      let!(:hops) { create_pair(:hop, brew_session: brew_sessions.first) }

      let(:query) do
        %(query {
          hops {
            title
          }
        })
      end

      it do
        expect(result.dig('data', 'hops')).to match_array(
          hops.map { |h| { 'title' => h.title } }
        )
      end
    end

    context 'return ingredients list' do
      let!(:ingredients) { create_pair(:ingredient, brew_session: brew_sessions.first) }

      let(:query) do
        %(query {
          ingredients {
            title
          }
        })
      end

      it do
        expect(result.dig('data', 'ingredients')).to match_array(
          ingredients.map { |i| { 'title' => i.title } }
        )
      end
    end

    context 'return users list' do
      let!(:users) { User.all }

      let(:query) do
        %(query {
          users {
            id
          }
        })
      end

      it do
        expect(result.dig('data', 'users')).to match_array(
          users.map { |u| { 'id' => u.id.to_s } }
        )
      end
    end

    context 'return mashSteps list' do
      let!(:mash_steps) { create_pair(:mash_step, brew_session: brew_sessions.first) }

      let(:query) do
        %(query {
          mashSteps {
            temperature
          }
        })
      end

      it do
        expect(result.dig('data', 'mashSteps')).to match_array(
          mash_steps.map { |ms| { 'temperature' => ms.temperature } }
        )
      end
    end
  end
end
