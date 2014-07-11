json.array!(@card_in_decks) do |card_in_deck|
  json.extract! card_in_deck, :id, :deck_of_card_id, :card_id, :order
  json.url card_in_deck_url(card_in_deck, format: :json)
end
