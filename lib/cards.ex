defmodule Cards do
  use TypeCheck

  @moduledoc """
  Documentation for `Cards`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Cards.hello()
      :world

  """
  def hello do
    :world
  end

  def create_deck do
    _values = ["Ace", "Seven", "King"]
    _suits = ["Spades", "Diamonds", "Hearts"]
  end

  @spec! shuffleDeck(Enum.t()) :: Enum.t()
  def shuffleDeck(deck) do
    Enum.shuffle(deck)
  end

  @spec! contains?(Enum.t(), String.t()) :: boolean
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end
end
