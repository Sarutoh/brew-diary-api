# frozen_string_literal: true

class BrewDiarySchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)
end
