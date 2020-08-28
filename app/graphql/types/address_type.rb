module Types
  class AddressType < Types::BaseObject
  graphql_name "Address"

  field :type, String, null: false
  field :coordinates, [Float], null: false
  end
end
