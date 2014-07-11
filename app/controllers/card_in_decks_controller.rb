class CardInDecksController < ApplicationController
  before_action :set_card_in_deck, only: [:show, :edit, :update, :destroy]

  # GET /card_in_decks
  # GET /card_in_decks.json
  def index
    @card_in_decks = CardInDeck.all
  end

  # GET /card_in_decks/1
  # GET /card_in_decks/1.json
  def show
  end

  # GET /card_in_decks/new
  def new
    @card_in_deck = CardInDeck.new(:deck_of_card_id => params[:deck_of_card_id])
  end

  # GET /card_in_decks/1/edit
  def edit
  end

  # POST /card_in_decks
  # POST /card_in_decks.json
  def create
    @card = Card.where(:display_name => card_in_deck_params[:display_name], :suit => card_in_deck_params[:suit])[0]
    @card_in_deck = CardInDeck.new(card_in_deck_params.merge(:card_id => @card.id))

    respond_to do |format|
      if @card_in_deck.save
        format.html { redirect_to @card_in_deck, notice: 'Card in deck was successfully created.' }
        format.json { render :show, status: :created, location: @card_in_deck }
      else
        format.html { render :new }
        format.json { render json: @card_in_deck.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /card_in_decks/1
  # PATCH/PUT /card_in_decks/1.json
  def update
    respond_to do |format|
      #card = Card.where(:display_name => card_in_deck_params[:display_name], :suit => card_in_deck_params[:suit])
      #card_in_deck_params[:card_id] = card.id
      #card_in_deck_params[:card_id] = 5
      if @card_in_deck.update(card_in_deck_params)
        format.html { redirect_to @card_in_deck, notice: 'Card in deck was successfully updated.' }
        format.json { render :show, status: :ok, location: @card_in_deck }
      else
        format.html { render :edit }
        format.json { render json: @card_in_deck.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /card_in_decks/1
  # DELETE /card_in_decks/1.json
  def destroy
    @card_in_deck.destroy
    respond_to do |format|
      format.html { redirect_to card_in_decks_url, notice: 'Card in deck was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_card_in_deck
      @card_in_deck = CardInDeck.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def card_in_deck_params
      params.require(:card_in_deck).permit(:deck_of_card_id, :card_id, :order)
    end
end
