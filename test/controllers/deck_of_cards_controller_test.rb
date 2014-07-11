require 'test_helper'

class DeckOfCardsControllerTest < ActionController::TestCase
  setup do
    @deck_of_card = deck_of_cards(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:deck_of_cards)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create deck_of_card" do
    assert_difference('DeckOfCard.count') do
      post :create, deck_of_card: {  }
    end

    assert_redirected_to deck_of_card_path(assigns(:deck_of_card))
  end

  test "should show deck_of_card" do
    get :show, id: @deck_of_card
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @deck_of_card
    assert_response :success
  end

  test "should update deck_of_card" do
    patch :update, id: @deck_of_card, deck_of_card: {  }
    assert_redirected_to deck_of_card_path(assigns(:deck_of_card))
  end

  test "should destroy deck_of_card" do
    assert_difference('DeckOfCard.count', -1) do
      delete :destroy, id: @deck_of_card
    end

    assert_redirected_to deck_of_cards_path
  end
end
