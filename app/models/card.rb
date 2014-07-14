class Card < ActiveRecord::Base
  DISPLAY_NAMES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace']
  SUITS = ['Spades', 'Clubs', 'Diamonds', 'Hearts']

  has_many :card_in_decks, dependent: :destroy
  has_many :deck_of_cards, through: :card_in_decks

  validates :number, presence: true
  validates :display_name, inclusion: {
      in: DISPLAY_NAMES,
      message: '%{value} is not a valid Display Name.'
    }
  validates :suit, inclusion: {
      in: SUITS,
      message: '%{value} is not a valid Suit.'
    }

  before_validation :set_number

  def make_all_cards
    Card.all.each do |card|
      card.destroy
    end
    Card::DISPLAY_NAMES.each do |display_name|
      Card::SUITS.each do |suit|
        Card.create(suit: suit, display_name: display_name)
      end
    end
  end

  protected
    def set_number
      (2..10).to_a.each do |num|
        if num.to_s == self.display_name
          self.number = num
        end
      end
      if 'Jack' == self.display_name
        self.number = 11
      elsif 'Queen' == self.display_name
        self.number = 12
      elsif 'King' == self.display_name
        self.number = 13
      elsif 'Ace' == self.display_name
        self.number = 14
      end
      return true
    end
end
