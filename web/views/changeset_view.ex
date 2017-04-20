defmodule RestApi.ChangesetView do
  use RestApi.Web, :view

  def translate_error({msg, opts}) do
    String.replace(msg, "%{count}", to_string(opts[:count]))
  end
  def translate_error(msg), do: msg

  def translate_errors(changeset) do
    Ecto.Changeset.traverse_errors(changeset, &translate_error/1)
  end

  def render("error.json", %{changeset: changeset}) do
    # When encoded, the changeset returns its errors
    # as a JSON object. So we just pass it forward.
    %{errors: translate_errors(changeset)}
  end
end
