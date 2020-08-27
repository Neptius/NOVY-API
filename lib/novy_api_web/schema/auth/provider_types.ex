defmodule NovyApiWeb.Schema.Auth.Provider do
  use Absinthe.Schema.Notation

  import Absinthe.Resolution.Helpers, only: [dataloader: 1]

  alias NovyApiWeb.Resolvers

  object :auth_provider do
    field :id, :id
    field :name, :string
    field :method, :string
    field :active, :boolean
    field :auth_provider_config, :auth_provider_config, resolve: dataloader(:auth_providers)
  end

  input_object :auth_provider_create_input do
    field :name, non_null(:string)
    field :method, non_null(:string)
    field :active, :boolean, default_value: false
  end

  input_object :auth_provider_update_input do
    field :id, non_null(:id)
    field :name, :string
    field :method, :string
    field :active, :boolean
  end

  input_object :auth_provider_exp do
    field(:_and, list_of(:auth_provider_exp))
    field(:_not, list_of(:auth_provider_exp))
    field(:_or, list_of(:auth_provider_exp))

    field(:id, :integer_generic_exp)
    field(:name, :text_generic_exp)
    field(:method, :text_generic_exp)
    field(:active, :boolean_generic_exp)
    field(:auth_provider_config, :auth_provider_config_exp)
  end

  input_object :auth_provider_order_by do
    field(:id, :order_by)
    field(:name, :order_by)
    field(:method, :order_by)
    field(:active, :order_by)
  end

  object :auth_provider_queries do
    @desc "Récupère un auth provider par sa clé primaire"
    field :auth_provider_by_pk, :auth_provider do
      arg(:id, non_null(:id))

      resolve(&Resolvers.Auth.Provider.provider_by_pk/3)
    end

    @desc "Récupère une liste d'auth provider"
    field :auth_provider_by, list_of(:auth_provider) do
      arg(:where, :auth_provider_exp)
      arg(:limit, :integer)
      arg(:offset, :integer)
      arg(:order_by, list_of(:auth_provider_order_by))

      resolve(&Resolvers.Auth.Provider.list_providers/3)
    end
  end

  object :auth_provider_mutations do
    @desc "Créé un auth provider"
    field :create_auth_provider, :auth_provider do
      arg(:auth_provider, non_null(:auth_provider_create_input))

      resolve(&Resolvers.Auth.Provider.create_provider/3)
    end

    @desc "Modifie un auth provider"
    field :update_auth_provider, :auth_provider do
      arg(:auth_provider, non_null(:auth_provider_update_input))

      resolve(&Resolvers.Auth.Provider.update_provider/3)
    end
  end
end
