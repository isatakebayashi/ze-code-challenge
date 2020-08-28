module Types
  class CoverageAreaType < Types::BaseObject
    graphql_name "CoverageArea"

    field :type, String, null: true
    field :coordinates, [[[[Float]]]], null: true
  end
end
