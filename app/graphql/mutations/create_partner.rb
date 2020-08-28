# frozen_string_literal: true

module Mutations
  class CreatePartner < GraphQL::Schema::RelayClassicMutation
    type Types::PartnerType

    argument :id, String, required: true
    argument :trading_name, String, required: true
    argument :owner_name, String, required: true
    argument :document, String, required: true
    argument :address, Types::AddressInputType, required: true
    argument :coverage_area, Types::CoverageAreaInputType, required: true

    def resolve(args)
      Partner.create!(
        id: args[:id],
        trading_name: args[:trading_name],
        owner_name: args[:owner_name],
        document: args[:document],
        coverage_area: args[:coverage_area].to_json,
        address: args[:address].to_json
      )
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new e.record.errors.full_messages
    end
  end
end
