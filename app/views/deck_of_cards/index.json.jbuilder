json.array!(@deck_of_cards) do |deck_of_card|
  json.extract! deck_of_card, :id
  json.url deck_of_card_url(deck_of_card, format: :json)
end
