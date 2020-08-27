defmodule NovyApi.Repo.Migrations.CreateAuthProviderConfigs do
  use Ecto.Migration

  def change do
    create table(:auth_provider_configs) do
      add :auth_provider_id, references(:auth_providers), null: false

      add :client_id, :string
      add :client_secret, :string
      add :authorize_url, :string
      add :token_url, :string
      add :redirect_url, :string
      add :user_url, :string
      add :response_type, :string
      add :scope, :string

      add :user_path, :string
      add :user_id_path, :string
      add :user_pseudo_path, :string
      add :user_img_url, :string
      add :user_img_path, :string

      timestamps()
    end
  end
end
