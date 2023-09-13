defmodule B1Web.HangmanHTML do
  use B1Web, :html

  embed_templates("hangman_html/*")

  def continue_or_try_again(conn, status) when status in[ :won, :lost ] do
    Phoenix.HTML.Link.button("Try again", to: B1Web.Router.Helpers.hangman_path(conn, :new), class: "py-2.5 px-5 mr-2 mb-2 text-sm font-medium text-gray-900 focus:outline-none bg-white rounded-lg border border-gray-200 hover:bg-gray-100 hover:text-blue-700 focus:z-10 focus:ring-4 focus:ring-gray-200 dark:focus:ring-gray-700 dark:bg-gray-800 dark:text-gray-400 dark:border-gray-600 dark:hover:text-white dark:hover:bg-gray-700")
  end

  def continue_or_try_again(conn, _) do
    Phoenix.HTML.Form.form_for(conn, B1Web.Router.Helpers.hangman_path(conn,  :update), [ as: ":make_move", method: :put ], fn f ->
      [
        Phoenix.HTML.Form.text_input(f, :guess, autofocus: "true"),
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

  defdelegate figure_for(turns_left), to: B1Web.HangmanHelpers.FigureFor
end
