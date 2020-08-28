module Types
  class AddressInputType < Types::BaseInputObject
  graphql_name "AddressInput"

  argument :type, String, required: true
  argument :coordinates, [Float], required: true
  end
end
