class CardInDeck < ActiveRecord::Base
  attr_accessor :display_name
  attr_accessor :suit
  attr_accessor :skip_order_validations

  belongs_to :deck_of_card
  belongs_to :card

  validates :card_id, :deck_of_card_id, :order, presence: true

  before_create :make_sure_card_unique_in_deck
  after_save :insert_card_in_proper_order, :reorder_deck
  after_destroy :reorder_deck

  protected
    def make_sure_card_unique_in_deck
      self.deck_of_card.cards.each do |card|
        if card.number == self.card.number && card.suit == self.card.suit
          return false
        end
      end
      return true
    end

    def insert_card_in_proper_order
      if self.skip_order_validations
        return true
      end
      cid_with_same_order = self.deck_of_card.card_in_decks.where(order: self.order)
      if cid_with_same_order
        cids = self.deck_of_card.card_in_decks.where(['`order` >= ? and id <> ?', self.order, self.id]).order('`order` desc')
        cids.each do |cid|
          cid.skip_order_validations = true
          cid.order = cid.order + 1
          cid.save
        end
      end
    end

    def reorder_deck
      if self.skip_order_validations
        return true
      end
      self.deck_of_card.reorder 
      return true
    end

  def <=>(other)
    [self.order, self.id] <=> [other.order, other.id]
  end

  include Comparable
end
