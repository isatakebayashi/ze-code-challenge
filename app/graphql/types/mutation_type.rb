module Types
  class MutationType < Types::BaseObject
    field :createPartner, mutation: Mutations::CreatePartner
  end
end
