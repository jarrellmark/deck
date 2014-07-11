class AddDeckOfCardIdToCardInDecks < ActiveRecord::Migration
  def change
    add_column :card_in_decks, :deck_of_card_id, :integer
  end
end
