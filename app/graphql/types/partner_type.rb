module Types
  class PartnerType < Types::BaseObject
    graphql_name "Partner"

    field :id, String, null: false
    field :trading_name, String, null: false
    field :owner_name, String, null: false
    field :document, String, null: false
    field :coverage_area, Types::CoverageAreaType, null: false
    field :address, Types::AddressType, null: false
  end
end
