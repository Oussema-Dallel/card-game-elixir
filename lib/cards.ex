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

  @spec! create_deck :: list
  def create_deck do
    values = ["Ace", "Seven", "King"]
    suits = ["Spades", "Diamonds", "Hearts"]

    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  @spec! shuffleDeck(Enum.t()) :: Enum.t()
  def shuffleDeck(deck) do
    Enum.shuffle(deck)
  end

  @spec! contains?(Enum.t(), String.t()) :: boolean
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @spec! deal(Enum.t(), number()) :: {Enum.t(), Enum.t()}
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end
end
