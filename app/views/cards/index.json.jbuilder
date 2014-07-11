json.array!(@cards) do |card|
  json.extract! card, :id, :number, :display_name, :suit
  json.url card_url(card, format: :json)
end
