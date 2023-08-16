# Pattern matching is a key to how we think about functional programming
# Elixir gives us the ability to match arbitrary structured data against a pattern, extracting elements of that data along the way. on top of that, elixir lets us choose what code to run based on the patterns that match ** THIS WILL COME IN HANDY ESP WITH ERROR HANDLING! ***

{ a, b } = { "cat", "dog" }
IO.puts a
IO.puts b

# if we have this, it would fail: { a, a } = { "cat", "dog" }
# this is because we bind cat to a, and now that it is bound, a cannot be changed for the rest of the expression


# For a match to succeed, the LHS and RHS must have the same shape, and each value on the right must match the corresponding value on the left. If the thing on the left is an unbound variable, Elixir binds that variable to the value being matched.

# ** NOTE: the LHS cannot contain any calculations or function calls!

# we can use a pin operator, an uparrow, ^ to ensure values do not get rebound. this is because all variables on the LHS of a match are unbound before a match is made.
#

a = 42
{ ^a, b } = { 42, 53}
# this would cause a match error: { ^a, b } = { 0, 1 }


# functions pattern match their parameters
# When you call a function, the arguments you pass are not simply assigned to the corresponding parameters in the function. Instead, each argument is pattern matched to its parameter.

# def func({ a, b }) do
#  IO.puts "a = #{a}, b = #{b}"
# end
# func({1, 2}) -> this will bind 1 to a, and 2 to b


# and like we said earlier, we can handle errors easily like this by leveraging atoms!
#
# def read_file({ :ok, file }) do
# def read_file({ :error, reason }) do 

# method overloading makes this pretty clean!
# Pattern matching in parameter lists means we can take functions that would otherwise be a mess of nested conditional logic and rewrite them as a set of small, focused functions, each of which handles just one particular flow.


