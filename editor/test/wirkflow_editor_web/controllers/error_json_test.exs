defmodule Wirkflow.EditorWeb.ErrorJSONTest do
  use Wirkflow.EditorWeb.ConnCase, async: true

  test "renders 404" do
    assert Wirkflow.EditorWeb.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert Wirkflow.EditorWeb.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
