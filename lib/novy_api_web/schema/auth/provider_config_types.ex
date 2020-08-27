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

  input_object :auth_provider_config_exp do
    field(:_and, list_of(:auth_provider_exp))
    field(:_not, list_of(:auth_provider_exp))
    field(:_or, list_of(:auth_provider_exp))

    field :client_id, :text_generic_exp
    field :client_secret, :text_generic_exp
    field :authorize_url, :text_generic_exp
    field :token_url, :text_generic_exp
    field :redirect_url, :text_generic_exp
    field :user_url, :text_generic_exp
    field :response_type, :text_generic_exp
    field :scope, :text_generic_exp

    field :user_path, :text_generic_exp
    field :user_id_path, :text_generic_exp
    field :user_pseudo_path, :text_generic_exp
    field :user_img_url, :text_generic_exp
    field :user_img_path, :text_generic_exp
  end
end
