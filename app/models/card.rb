class Card < ActiveRecord::Base
  #attr_accessible :number, :display_name, :suit
  has_many :card_in_decks
  has_many :deck_of_cards, :through => :card_in_decks
end
