defmodule HangmanImplGameTest do
  use ExUnit.Case
  alias Hangman.Impl.Game

  test "new game returns structure" do
    game = Game.new_game

    assert game.turns_left == 7
    assert game.game_state == :initializing
    assert length(game.letters) > 0
  end

  test "new game returns correct word" do
    game = Game.new_game("wombat")

    assert game.turns_left == 7
    assert game.game_state == :initializing
    assert game.letters == ["w","o","m","b","a","t"]
  end

  test "word only contains lower case ASCII" do
    game = Game.new_game("wombat")

    Enum.each(game.letters, fn codepoint ->
      assert codepoint == String.downcase(codepoint)
      assert Regex.match?(~r/[a-z]/, codepoint)
    end)
  end

end

