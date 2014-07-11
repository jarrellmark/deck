class CreateCardInDecks < ActiveRecord::Migration
  def change
    create_table :card_in_decks do |t|
      t.integer :deck_of_card_id
      t.integer :card_id
      t.integer :order

      t.timestamps
    end
  end
end
