class AddCardIdToCardInDecks < ActiveRecord::Migration
  def change
    add_column :card_in_decks, :card_id, :integer
  end
end
