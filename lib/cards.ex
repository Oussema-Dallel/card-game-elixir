defmodule Cards do
  use TypeCheck

  @moduledoc """
  Provides methods for creating and handlonga deck of `Cards`.
  """

  @doc """
  Creates a deck of cards, the cards are a combination of `values` and `suits`
  """
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

  @doc """
    Splits the deck of cards into two according to the `hand_size`, the latter determines how many
    cards goes into the hand.
  
    ## Examples
  
    iex> deck = Cards.create_deck()
    iex> {hand, rest} = Cards.deal(deck, 1)
    iex> hand
    ["Ace of Spades"]
  """
  @spec! deal(Enum.t(), number()) :: {Enum.t(), Enum.t()}
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  @spec! save_deck(Enum.t(), String.t()) :: any()
  def save_deck(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  @spec! load_deck(String.t()) :: Enum.t() | String.t()
  def load_deck(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _reason} -> "File does not exist"
    end
  end

  @spec! create_hand(integer) :: {Enum.t(), Enum.t()}
  def create_hand(hand_size) do
    Cards.create_deck()
    |> Cards.shuffleDeck()
    |> Cards.deal(hand_size)
  end
end
