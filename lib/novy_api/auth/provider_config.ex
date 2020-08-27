defmodule NovyApi.Auth.ProviderConfig do
  use Ecto.Schema
  import Ecto.Changeset

  alias NovyApi.Auth.Provider

  schema "auth_provider_configs" do
    field :client_id, :string
    field :client_secret, :string
    field :authorize_url, :string
    field :token_url, :string
    field :redirect_url, :string
    field :user_url, :string
    field :response_type, :string
    field :scope, :string

    field :user_path, :string
    field :user_id_path, :string
    field :user_pseudo_path, :string
    field :user_img_url, :string
    field :user_img_path, :string

    belongs_to :auth_provider, Provider

    timestamps()
  end

  @doc false
  def changeset(provider_config, attrs) do
    provider_config
    |> cast(attrs, [
      :client_id,
      :client_secret,
      :authorize_url,
      :token_url,
      :redirect_url,
      :user_url,
      :response_type,
      :scope,
      :user_path,
      :user_id_path,
      :user_pseudo_path,
      :user_img_url,
      :user_img_path
    ])
    |> validate_required([
      :client_id,
      :client_secret,
      :authorize_url,
      :token_url,
      :redirect_url,
      :user_url,
      :response_type,
      :scope,
      :user_path,
      :user_id_path,
      :user_pseudo_path,
      :user_img_url,
      :user_img_path
    ])
  end
end
