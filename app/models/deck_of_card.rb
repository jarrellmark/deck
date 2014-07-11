class DeckOfCard < ActiveRecord::Base
  has_many :card_in_decks, -> { order 'card_in_decks.`order`' }
  has_many :cards, -> { order 'card_in_decks.`order`' }, :through => :card_in_decks
  def reorder_cards
    i = 1
    self.card_in_decks.each do |card_in_deck|
      if card_in_deck.order != i
        card_in_deck.order = i 
      end 
      i += 1
    end
  end
end
