module Types
  class CoverageAreaInputType < Types::BaseInputObject
    graphql_name "CoverageAreaInput"

    argument :type, String, required: true
    argument :coordinates, [[[[Float]]]], required: true
  end
end
