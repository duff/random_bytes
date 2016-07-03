defmodule RandomBytesTest do

  use ExUnit.Case, async: true

  describe "base62" do
    test "defaults to 16 bytes" do
      assert String.length(RandomBytes.base62) == 22
    end

    test "allows num_bytes to be specified" do
      assert String.length(RandomBytes.base62(5)) == 7
      assert String.length(RandomBytes.base62(32)) == 43
    end

    test "not the same each time" do
      assert RandomBytes.base62 != RandomBytes.base62
    end

    test "only has letters and numbers - no plus signs or forward slashes" do
      refute String.contains?(RandomBytes.base62(100), ["+", "/"])
    end
  end

  describe "base16" do
    test "defaults to 16 bytes" do
      assert String.length(RandomBytes.base16) == 32
    end

    test "not the same each time" do
      assert RandomBytes.base16 != RandomBytes.base16
    end
  end

  describe "uuid" do
    test "not the same each time" do
      assert RandomBytes.uuid != RandomBytes.uuid
    end

    test "uses 16 bytes and includes 4 dashes" do
      assert String.length(RandomBytes.uuid) == 36
      assert RandomBytes.uuid |> String.split("-") |> Enum.count == 5
    end

    test "position 13 is a 4" do
      position_14 = RandomBytes.uuid |> String.at(14)
      assert position_14 == "4"
    end

    test "position 19 contains an 8, 9, a, or b" do
      position_19 = RandomBytes.uuid |> String.at(19)
      assert String.contains?(position_19, ["8", "9", "a", "b"])
    end
  end

end
