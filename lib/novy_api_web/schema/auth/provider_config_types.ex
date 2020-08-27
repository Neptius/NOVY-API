defmodule NovyApiWeb.Schema.Auth.ProviderConfig do
  use Absinthe.Schema.Notation

  alias NovyApiWeb.Resolvers

  object :auth_provider_config do
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
  end
end
