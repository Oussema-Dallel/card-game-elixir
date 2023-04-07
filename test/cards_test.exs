defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "creates a deck with 9 cards" do
    deck_length = length(Cards.create_deck())
    assert deck_length == 9
  end

  test "creates a hand" do
    {hand, deck_rest} = Cards.create_hand(1)
    assert length(hand) == 1
    assert length(deck_rest) == 8
  end
end
