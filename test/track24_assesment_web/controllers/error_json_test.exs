defmodule Track24AssesmentWeb.ErrorJSONTest do
  use Track24AssesmentWeb.ConnCase, async: true

  test "renders 404" do
    assert Track24AssesmentWeb.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert Track24AssesmentWeb.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
