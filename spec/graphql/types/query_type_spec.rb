# frozen_string_literal: true

RSpec.describe Types::QueryType do
  describe 'brew_sessions' do
    subject(:result) do
      BrewDiarySchema.execute(query).as_json
    end

    let!(:brew_sessions) { create_pair(:brew_session) }

    let(:query) do
      %(query {
        brewSessions {
          title
        }
      })
    end

    it 'returns all brew_sessions' do
      expect(result.dig('data', 'brewSessions')).to match_array(
        brew_sessions.map { |bs| { 'title' => bs.title } }
      )
    end
  end
end
