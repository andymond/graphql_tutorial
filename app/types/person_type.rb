PersonType = GraphQL::ObjectType.define do
  name "Person"
  description "A Person"
  field :id, types.ID
  field :name, types.string
  field :surname, types.string
  field :pets do
    type types[PetType]
    resolve -> (person, args, ctx) {
      person.pets
    }
    # resolve gets person.pets from the db, then structures it with the PetType we specified in the block
  end
end
