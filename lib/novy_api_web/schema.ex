defmodule NovyApiWeb.Schema do
  use Absinthe.Schema

  alias NovyApiWeb.Schema

  import_types(Schema.GenericExp)
  import_types(Schema.Auth.Provider)
  import_types(Schema.Auth.ProviderConfig)

  alias NovyApi.Auth.Provider

  def context(ctx) do
    loader =
      Dataloader.new()
      |> Dataloader.add_source(:auth_providers, Provider.data())

    Map.put(ctx, :loader, loader)
  end

  def plugins do
    [Absinthe.Middleware.Dataloader] ++ Absinthe.Plugin.defaults()
  end

  query do
    import_fields(:auth_provider_queries)
  end

  mutation do
    import_fields(:auth_provider_mutations)
  end

  # subscription do

  # end
end
