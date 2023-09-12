defmodule B1Web.HangmanHTML do
  use B1Web, :html

  embed_templates("hangman_html/*")

  def continue_or_try_again(conn, status) when status in[ :won, :lost ] do
    Phoenix.HTML.Link.button("Try again", to: B1Web.Router.Helpers.hangman_path(conn, :new))
  end

  def continue_or_try_again(conn, _) do
    Phoenix.HTML.Form.form_for(conn, B1Web.Router.Helpers.hangman_path(conn,  :update), [ as: ":make_move", method: :put ], fn f ->
      [
        Phoenix.HTML.Form.text_input(f, :guess),
        " ",
        Phoenix.HTML.Form.submit("Make guess", class: "text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 mr-2 mb-2 dark:bg-blue-600 dark:hover:bg-blue-700 focus:outline-none dark:focus:ring-blue-800")
      ]
   end)
  end

  @status_fields %{
    initializing:  {"initializing",  "Guess the word, a letter a a time" },
    good_guess:    {"good-guess",    "Good guess!"},
    bad_guess:     {"bad-guess",     "Sorry, that's a bad guess"},
    won:           {"won",           "You won!"},
    lost:          {"lost",          "Sorry, you lost"},
    invalid_guess: {"invalid-guess", "This is an invalid guess"},
    already_used:  {"already-used",  "You already used that letter"}
  }

  def move_status(status) do
    { class, msg } = @status_fields[status]
    "<div class='status #{class}'>#{msg}</div>"
  end

  def figure_for(0) do
    ~s{
      ┌───┐
      │   │
      O   │
     /|\\  │
     / \\  │
          │
    ══════╧══
    }
  end

  def figure_for(1) do
    ~s{
      ┌───┐
      │   │
      O   │
     /|\\  │
     /    │
          │
    ══════╧══
    }
  end

  def figure_for(2) do
    ~s{
    ┌───┐
    │   │
    O   │
   /|\\  │
        │
        │
  ══════╧══
}
  end

  def figure_for(3) do
    ~s{
    ┌───┐
    │   │
    O   │
   /|   │
        │
        │
  ══════╧══
}
  end

  def figure_for(4) do
    ~s{
    ┌───┐
    │   │
    O   │
    |   │
        │
        │
  ══════╧══
}
  end

  def figure_for(5) do
    ~s{
    ┌───┐
    │   │
    O   │
        │
        │
        │
  ══════╧══
}
  end

  def figure_for(6) do
    ~s{
    ┌───┐
    │   │
        │
        │
        │
        │
  ══════╧══
}
  end

  def figure_for(7) do
    ~s{
    ┌───┐
        │
        │
        │
        │
        │
  ══════╧══
}
  end
end
