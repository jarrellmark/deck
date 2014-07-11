class DeckOfCardsController < ApplicationController
  before_action :set_deck_of_card, only: [:show, :edit, :update, :destroy]

  # GET /deck_of_cards
  # GET /deck_of_cards.json
  def index
    @deck_of_cards = DeckOfCard.all
  end

  # GET /deck_of_cards/1
  # GET /deck_of_cards/1.json
  def show
  end

  # GET /deck_of_cards/new
  def new
    @deck_of_card = DeckOfCard.new
  end

  # GET /deck_of_cards/1/edit
  def edit
  end

  # POST /deck_of_cards
  # POST /deck_of_cards.json
  def create
    @deck_of_card = DeckOfCard.new(deck_of_card_params)

    respond_to do |format|
      if @deck_of_card.save
        format.html { redirect_to @deck_of_card, notice: 'Deck of card was successfully created.' }
        format.json { render :show, status: :created, location: @deck_of_card }
      else
        format.html { render :new }
        format.json { render json: @deck_of_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /deck_of_cards/1
  # PATCH/PUT /deck_of_cards/1.json
  def update
    respond_to do |format|
      if @deck_of_card.update(deck_of_card_params)
        format.html { redirect_to @deck_of_card, notice: 'Deck of card was successfully updated.' }
        format.json { render :show, status: :ok, location: @deck_of_card }
      else
        format.html { render :edit }
        format.json { render json: @deck_of_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /deck_of_cards/1
  # DELETE /deck_of_cards/1.json
  def destroy
    @deck_of_card.destroy
    respond_to do |format|
      format.html { redirect_to deck_of_cards_url, notice: 'Deck of card was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_deck_of_card
      @deck_of_card = DeckOfCard.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def deck_of_card_params
      params[:deck_of_card]
    end
end
