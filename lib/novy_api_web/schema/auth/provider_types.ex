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

  object :auth_provider_subscriptions do
    field :auth_provider_added, :auth_provider do

      # The topic function is used to determine what topic a given subscription
      # cares about based on its arguments. You can think of it as a way to tell the
      # difference between
      # subscription {
      #   commentAdded(repoName: "absinthe-graphql/absinthe") { content }
      # }
      #
      # and
      #
      # subscription {
      #   commentAdded(repoName: "elixir-lang/elixir") { content }
      # }
      #
      # If needed, you can also provide a list of topics:
      #   {:ok, topic: ["absinthe-graphql/absinthe", "elixir-lang/elixir"]}
      config fn args, _info ->
        {:ok, topic: "*"}
      end

      # this tells Absinthe to run any subscriptions with this field every time
      # the :submit_comment mutation happens.
      # It also has a topic function used to find what subscriptions care about
      # this particular comment
      trigger :submit_comment, topic: fn comment ->
        comment.repository_name
      end

      resolve fn root, _, _ ->
        # this function is often not actually necessary, as the default resolver
        # for subscription functions will just do what we're doing here.
        # The point is, subscription resolvers receive whatever value triggers
        # the subscription, in our case a comment.
        IO.inspect(root)
        {:ok, root}
      end

    end
  end
end
