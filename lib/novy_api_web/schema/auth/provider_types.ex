defmodule NovyApiWeb.Schema.Auth.Provider do
  use Absinthe.Schema.Notation

  alias NovyApiWeb.Resolvers

  object :provider do
    field :id, :id
    field :name, :string
    field :method, :string
    field :active, :boolean
  end

  input_object :provider_create_input do
    field :name, non_null(:string)
    field :method, non_null(:string)
    field :active, :boolean, default_value: false
  end

  input_object :provider_update_input do
    field :id, non_null(:id)
    field :name, :string
    field :method, :string
    field :active, :boolean
  end

  object :provider_queries do
    field :providers, list_of(:provider) do
      resolve(&Resolvers.Auth.Provider.list_providers/2)
    end
  end

  object :provider_mutations do
    @desc "Create a provider"
    field :create_provider, :provider do
      arg(:provider, non_null(:provider_create_input))

      resolve(&Resolvers.Auth.Provider.create_provider/3)
    end

    @desc "Update a provider"
    field :update_provider, :provider do
      arg(:provider, non_null(:provider_update_input))

      resolve(&Resolvers.Auth.Provider.update_provider/3)
    end
  end
end
