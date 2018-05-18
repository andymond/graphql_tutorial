QueryType = GraphQL::ObjectType.define do
  name "Query"
  description "Query Root for Schema"

  field :pets do
    type types[PetType]
    resolve -> (obj, args, ctx) {
      Pet.all
    }
  end

  field :people do
    type types[PersonType]
    resolve -> (obj, args, ctx) {
      Person.all
    }
  end
  # ^^^ defining fields we know how to query, we grab all records here and use the type definitions to filter data

  # example query submitted through the body of our post request:
  # query {
  #   people {
  #     name
  #     surname
  #     pets {
  #       name
  #     }
  #   }
  # }
  # this query will return the data formatted exactly as we queried it, which is nice for providing client side documentation as to what we should expect to return from the API
end
