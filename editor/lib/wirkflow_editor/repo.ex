defmodule Wirkflow.Editor.Repo do
  use Ecto.Repo,
    otp_app: :wirkflow_editor,
    adapter: Ecto.Adapters.Postgres
end
