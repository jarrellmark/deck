require 'test_helper'

class CardInDecksControllerTest < ActionController::TestCase
  setup do
    @card_in_deck = card_in_decks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:card_in_decks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create card_in_deck" do
    assert_difference('CardInDeck.count') do
      post :create, card_in_deck: { card_id: @card_in_deck.card_id, deck_of_card_id: @card_in_deck.deck_of_card_id, order: @card_in_deck.order }
    end

    assert_redirected_to card_in_deck_path(assigns(:card_in_deck))
  end

  test "should show card_in_deck" do
    get :show, id: @card_in_deck
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @card_in_deck
    assert_response :success
  end

  test "should update card_in_deck" do
    patch :update, id: @card_in_deck, card_in_deck: { card_id: @card_in_deck.card_id, deck_of_card_id: @card_in_deck.deck_of_card_id, order: @card_in_deck.order }
    assert_redirected_to card_in_deck_path(assigns(:card_in_deck))
  end

  test "should destroy card_in_deck" do
    assert_difference('CardInDeck.count', -1) do
      delete :destroy, id: @card_in_deck
    end

    assert_redirected_to card_in_decks_path
  end
end
