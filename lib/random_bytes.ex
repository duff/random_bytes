defmodule RandomBytes do
  @moduledoc ~S"""
  Generate random strings in a few different formats.
  """

  @doc """
  Generates a random base62 string.

  A `base64` string typically contains the `+` and `\/` characters as its extra 2 characters.
  When the string will be used in a url, the `+` and `\/` are usually replaced with `-` and `_`.

  This function generates a `base62` string, not a `base64` string.  It returns only letters and
  numbers and doesn't include the two special characters. The result string can contain the following
  characters: `A-Z`, `a-z`, `0-9`.

  The length of the result string is about 4/3 of `num_bytes`.

  ## Examples

      iex> RandomBytes.base62
      "zx1QBjpTMPuHKBHpQBv9IQ"
      iex> RandomBytes.base62(30)
      "io0i0jE70S2PmvBvnnE6272JbpBaoLbmxJmJXJUL"
      iex> RandomBytes.base62(10)
      "8BfF7DS2nxsPyg"
  """
  def base62(num_bytes \\ 16) do
    random_bytes(num_bytes)
    |> Base.encode64(padding: false)
    |> String.replace(~r/[+\/]/, random_char)
  end

  @doc """
  Generates a random base16 string.

  The result string can contain the following characters: `0-9`, `a-f`.

  The length of the result string is twice `num_bytes`.

  ## Examples

      iex> RandomBytes.base16
      "442141c62390aa41c7c2561df1ba7c68"
      iex> RandomBytes.base16(3)
      "dc4bca"
  """
  def base16(num_bytes \\ 16) do
    random_bytes(num_bytes)
    |> Base.encode16(case: :lower)
  end

  @doc """
  Generates a UUID (universally unique identifier).

  This is a [v4 UUID](https://en.wikipedia.org/wiki/Universally_unique_identifier#Version_4_.28random.29)
  defined by [RFC 4122](https://tools.ietf.org/html/rfc4122).

  ## Examples

      iex> RandomBytes.uuid
      "5b1e4da9-bdf4-46d6-a741-21d2d1827e13"
      iex> RandomBytes.uuid
      "153282b3-0e2d-4e10-8839-cb0ee869e898"
  """
  def uuid do
    Regex.run(uuid_regex, base16, capture: :all_but_first)
    |> Enum.join("-")
    |> String.to_charlist
    |> List.replace_at(14, ?4)
    |> List.replace_at(19, Enum.random('89ab'))
    |> List.to_string
  end

  defp uuid_regex do
    ~r/(.{8})(.{4})(.{4})(.{4})(.{12})/
  end

  @base62_alphabet 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789'

  defp random_char do
    [Enum.random(@base62_alphabet)] |> to_string
  end

  defp random_bytes(num) do
    :crypto.strong_rand_bytes(num)
  end

end
