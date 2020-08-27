defmodule NovyApiWeb.Resolvers.Auth.ProviderConfig do
  alias NovyApi.Auth.Provider

  def provider_by_pk(_parent, %{id: id}, _resolution) do
    case Provider.get_provider!(id) do
      %Provider{} = provider -> {:ok, provider}
      _ -> {:error, "Provider introuvable"}
    end
  end

  def list_providers(_parent, args, _resolution) do
    IO.inspect(args)
    {:ok, Provider.list_providers()}
  end

  # def create_provider(_parent, %{provider: args}, %{context: %{current_user: user}}) do
  def create_provider(_parent, %{provider: args}, _resolution) do
    case Provider.create_provider(args) do
      {:ok, %Provider{} = provider} -> {:ok, provider}
      {:error, changeset} -> {:error, inspect(changeset.errors)}
    end
  end

  def update_provider(_parent, %{provider: %{id: id} = args}, _resolution) do
    with %Provider{} = provider <- Provider.get_provider!(id),
         {:ok, %Provider{} = providerSaved} <- Provider.update_provider(provider, args) do
      {:ok, providerSaved}
    else
      {:error, error} ->
        {:error, error}

      _ ->
        {:error, "Provider invalide"}
    end
  end

  # def create_provider(_parent, _args, _resolution), do: {:error, "Not Authorized"}
end
