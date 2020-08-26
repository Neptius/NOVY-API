defmodule NovyApi.Repo.Migrations.CreateAuthProviders do
  use Ecto.Migration

  def change do
    create table(:auth_providers) do
      add :name, :string
      add :method, :string
      add :active, :boolean, default: false

      timestamps()
    end

  end
end
