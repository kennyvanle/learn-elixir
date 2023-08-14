defmodule StaticSiteTest do
  use ExUnit.Case
  doctest StaticSite

  test "greets the world" do
    assert StaticSite.hello() == :world
  end
end
