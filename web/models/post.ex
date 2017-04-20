defmodule RestApi.Post do
  use RestApi.Web, :model

  @derive {Poison.Encoder, only: [:title, :content]}
  schema "posts" do
    field :title, :string
    field :content, :string

    timestamps()
  end

  @required_fields [:title, :content]

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields)
    |> validate_required(@required_fields)
  end
end
