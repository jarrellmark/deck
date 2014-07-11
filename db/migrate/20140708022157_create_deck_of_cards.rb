class CreateDeckOfCards < ActiveRecord::Migration
  def change
    create_table :deck_of_cards do |t|

      t.timestamps
    end
  end
end
