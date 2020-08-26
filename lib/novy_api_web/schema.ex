defmodule NovyApiWeb.Schema do
  use Absinthe.Schema

  alias NovyApiWeb.Schema

  import_types(Schema.Auth.Provider)

  query do
    import_fields(:provider_queries)
  end

  mutation do
    import_fields(:provider_mutations)
  end

  # subscription do

  # end
end
