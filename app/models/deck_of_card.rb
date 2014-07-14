class DeckOfCard < ActiveRecord::Base
  has_many :card_in_decks, -> { order 'card_in_decks.`order`' }, dependent: :destroy
  has_many :cards, -> { order 'card_in_decks.`order`' }, :through => :card_in_decks

  def reorder
    i = 1
    self.card_in_decks.each do |card_in_deck|
      if card_in_deck.order != i
        card_in_deck.skip_order_validations = true
        card_in_deck.order = i 
        card_in_deck.save
      end 
      i += 1
    end
  end

  def shuffle
    cids = self.card_in_decks
    randoms = (1..cids.size).to_a.shuffle
    cids.each do |card_in_deck|
      card_in_deck.order = randoms.shift
      card_in_deck.skip_order_validations = true
      card_in_deck.save
    end 
  end

  def add_all_cards
    self.card_in_decks.each do |card_in_deck|
      card_in_deck.destroy
    end
    Card.all.each do |card|
      card_in_deck = CardInDeck.new(card_id: card.id, deck_of_card_id: self.id, order: 1)
      card_in_deck.save
    end
  end
end
