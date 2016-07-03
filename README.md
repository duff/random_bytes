# RandomBytes

Generate random strings.

## Installation

Add `random_bytes` to your list of dependencies in `mix.exs`:

```elixir
  def deps do
    [{:random_bytes, "~> 1.0"}]
  end
```

## Usage

Generate a random [base62](RandomBytes.html#base62/1) string:
```elixir
iex> RandomBytes.base62
"HMVrjeb1GvIPSlqVbZhHig"
iex> RandomBytes.base62(28)
"KDGpJ5xQsQSTnIUZN4CZcetG3yDSZXWzrwM6BA"
iex> RandomBytes.base62(9)
"88XuyJDWK2LA"
```

Generate a random [base16](RandomBytes.html#base16/1) string:
```elixir
iex> RandomBytes.base16
"e1d227efd5ae7d359fb6a3fff23ae44e"
iex> RandomBytes.base16(4)
"bc859e88"
```

Generate a [UUID](RandomBytes.html#uuid/0):
```elixir
iex> RandomBytes.uuid
"6c2bc294-a8f4-4d64-8fb4-5fda8b1d7763"
```

## Copyright and License

Copyright (c) 2016, [Duff O'Melia](https://github.com/duff)

Apache 2 License (same as Elixir).  See LICENSE file for more information.
