defmodule NovyApiWeb.Schema.GenericExp do
  use Absinthe.Schema.Notation

  input_object :text_generic_exp do
    field(:eq, :string)
    field(:gt, :string)
    field(:gte, :string)
    field(:ilike, :string)
    field(:in, list_of(:string))
    field(:isnull, :boolean)
    field(:like, :string)
    field(:lt, :string)
    field(:lte, :string)
    field(:neq, :string)
    field(:nilike, :string)
    field(:nin, list_of(:string))
    field(:nlike, :string)
    field(:nsimilar, :string)
    field(:similar, :string)
  end

  input_object :integer_generic_exp do
    field(:eq, :integer)
    field(:gt, :integer)
    field(:gte, :integer)
    field(:in, list_of(:integer))
    field(:isnull, :boolean)
    field(:lt, :integer)
    field(:lte, :integer)
    field(:neq, :integer)
    field(:nin, list_of(:integer))
  end

  input_object :boolean_generic_exp do
    field(:eq, :boolean)
    field(:gt, :boolean)
    field(:gte, :boolean)
    field(:in, list_of(:boolean))
    field(:isnull, :boolean)
    field(:lt, :boolean)
    field(:lte, :boolean)
    field(:neq, :boolean)
    field(:nin, list_of(:boolean))
  end

  enum :order_by do
    value(:asc)
    value(:desc)
  end
end
