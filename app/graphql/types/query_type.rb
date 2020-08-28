module Types
  class QueryType < Types::BaseObject
    field :partner, PartnerType, null: true do
      description 'Find a partner by ID'
      argument :id, String, required: true
    end

    field :find_partners, PartnerType, null: true do
      description 'Find partners by coordinates'
      argument :lat, Float, required: true
      argument :long, Float, required: true
    end

    def partner(id:)
      Partner.find(id)
    end

    def find_partners(lat:, long:)
      partner = Partner.nearest_partner(lat, long).first
      id = partner['id']
      Partner.find(id)
    end
  end
end
