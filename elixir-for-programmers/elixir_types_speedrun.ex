# Integers and floats
# Elixir integers can be arbitrarily big (within the limits of available memory).
# You can write them with underscores between the digits. Normally this is used as a surrogate for commas.
#The prefixes 0x, 0o, and 0b indicate literals using hexadecimal, octal, and binary notation. (Note that you cannot use just a leading zero to indicate an octal constant.)

IO.puts 123456 == 123456
IO.puts 65 == 0x41
IO.puts 65 == 0o101
IO.puts 65 == 0b01000001
IO.puts 65 == ?A

IO.puts 8/3
IO.puts div(8,3)
IO.puts trunc(8/3)
IO.puts round(8/3)

# Floats are stored in IEEE 754 format. Literal floats must have at least one digit before and after the decimal point, and may have an e suffix to indicate an exponent.


#Atoms
#Atoms are constants that are used to name things. In a way they are just like strings—the difference is in the representation.
#create an atom by using a colon to prefix a name or operator, or use uppercase.when we define a defmodule like Dictionary, Dictionary is an atom.

:hi
a = 99
IO.puts :"next-number: #{a+1}"

# to avoid a name clase, elixir automatically adds a prefix Elixir. to atoms derived from capital names
#
IO.puts is_atom(Dictionary) # true
IO.puts(Dictionary == :"Elixir.Dictionary") # true

# Booleans
# elixir uses constants true and false for boolean. true and false are also atoms!
# elixir treats constant nil as a false value
# nil and false are considered false, all other values are truthy

# There are two sets of logical operators. The ones using traditional operator symbols (&&, ||, !) work with truthy values. Operators that are spelled-out words (and, or, not) only accept true or false on their left hand side.
# && and and return their right hand value if the left hand is truthy (or true), and || and or return the right hand value if the left is falsy

# you can not use the logical operators to do bit operations, but there are libraries for this.

# Ranges
# ranges represent a bounded set of integers and we can use the "in" operator to check that an integer falls between bound

a = 5..10
IO.puts(6 in a) # true

# ranges are enumerable and so are used as a starting point for iterations
b = 1..5
for i <- b, do: IO.puts(i)


# Strings and Sigils
# elixir has conventional-looking string constants (characters between double quotes) but also has a way of specifying other string like constants. these general constants are called sigils.
# In our Dictionary, we split the word file into words using String.split. We wrote it as:

# String.split(str, ~r/\n/)
# The syntax ~r... is an example of an Elixir sigil—a generic way of writing string-like constants.
# A sigil is simply a notation for creating values from strings. In the regular expression example, the string was \n and the value created was the corresponding regular expression.
# sigils start with a ~
# the sigils that come as part of elixir are:
# ~c//	~C//	list of character codes
# ~r//	~R//	regular expression
# ~s//	~S//	string
# ~w//	~W//	list of words
#
IO.puts "At the tone, it will be #{Time.utc_now}" 
IO.puts ~s<At the tone, it will be #{Time.utc_now}>
IO.inspect ~w[now is the time] # list of words

# Regular expression literals
# The Regex module contains most of the functions that work with regular expressions. In addition the operator =~ can perform a regular expression match.
s = "once upon a time"
IO.puts(s =~ ~r/u..n/) # true
IO.puts(s =~ ~r/u..m/) # false


a = "hotdog" |> String.replace(~s"hot", "cat") # catdog
IO.puts a

# Tuples
# A tuple is a fixed-length collection of values. Back when you did geometry in school, you used tuples all the time to group things together: {x,y} and {x,y,z} are both tuples.
# Elixir's tuples serve the same function—they group things together. They're more flexible the tuples in math, though, because they can contain values of different types.
# we will often see tuples used like { :ok, contents } or { :error, reason }
# this is awesome because we can use overloading to write some clean code without having to wrap everything in checks



# Lists
# Lists are a central part of Elixir. This isn't just because they are a useful data structure. It's also because the definition and structure of lists is ideally suited to a functional language.

# !!! LISTS ARE NOT ARRAYS!!!
# Lists are a sequence of zero of more elements, one linked to the next.

# empty list is [] or a value fllowed by a list [ value | list ]
#
# The value part of the definition is normally called the head of the list, and the rest is called the tail.

# That's a convention in Elixir. Rather than making you build lists the hard way, you can write them using the conventional comma-separated list of values. But never forget that nonempty lists always have a head, which is a value, and a tail, which is a list.

# lists are a recursive data structure which is why we use them in functional programming



# Maps
# Maps are an unordered collection of key/value pairs. Both keys and values can be any Elixir type, and those types can be mixed within a map.

countries = %{
 "BFA" => "Burkina Faso",
 "BDI" => "Burundi",
 "KHM" => "Cambodia",
 "CMR" => "Cameroon",
 "CAN" => "Canada",
}

IO.inspect countries

# You use the functions in the Map and Enum modules to work with maps. In addition, Elixir provides the map[key] shortcut to return the value corresponding to key (or nil).

# When you use the [] notation, then a map either returns the value or nil. When you use the dot notation, Elixir raises an error for unknown keys.

