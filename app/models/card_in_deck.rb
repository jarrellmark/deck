class CardInDeck < ActiveRecord::Base
  attr_accessor :display_name
  attr_accessor :suit

  belongs_to :deck_of_card
  belongs_to :card

  validates :card_id, :deck_of_card_id, :order, presence: true

  before_create :make_sure_card_unique_in_deck

  protected
    def make_sure_card_unique_in_deck
      self.deck_of_card.cards.each do |card|
        if card.number == self.card.number && card.suit == self.card.suit
          return false
        end
      end
      return true
    end
end
