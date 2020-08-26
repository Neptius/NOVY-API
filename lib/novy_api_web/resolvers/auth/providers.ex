defmodule NovyApiWeb.Resolvers.Auth.Provider do
  alias NovyApi.Auth.Provider

  def list_providers(_args, _context) do
    {:ok, Provider.list_providers()}
  end

  #def create_provider(_parent, %{provider: args}, %{context: %{current_user: user}}) do
  def create_provider(_parent, %{provider: args}, _resolution) do
    case Provider.create_provider(args) do
      {:ok, %Provider{} = provider} -> {:ok, provider}
      {:error, changeset} -> {:error, inspect(changeset.errors)}
    end
  end

  def update_provider(_parent, %{provider: %{id: id} = args}, _resolution) do
    case Provider.get_provider!(id) do
      nil ->
        {:error, "Provider not found"}

      %Provider{} = provider ->
        case Provider.update_provider(provider, args) do
          {:ok, %Provider{} = provider} -> {:ok, provider}
          {:error, changeset} -> {:error, inspect(changeset.errors)}
        end
    end
  end


  # def create_provider(_parent, _args, _resolution), do: {:error, "Not Authorized"}
end
