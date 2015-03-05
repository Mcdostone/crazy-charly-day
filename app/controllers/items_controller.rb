class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items
  # GET /items.json
  def index
    @items = Item.all
    @pieces = Piece.all
    @types = Type.all
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
    @pieces = Piece.all
    @types = Type.all
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # GET /items/couleur/rouge
  def from_color
    @items = Item.where filter_params
    respond_to do |format|
      format.js { render 'items/filter' }
    end
  end

  # GET /items/type/id
  def from_type
    #['type_id = ?', params[:type_id]]
    @selected = Item.where filter_params
    respond_to do |format|
      format.js { render 'items/filter' }
    end
  end

  # GET /items/piece/id
  def from_piece
    @selected = Item.where filter_params
    respond_to do |format|
      format.js { render 'items/filter' }
    end
  end

  def best
    @items = Item.order('likes DESC').take 5
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    def filter_params
      params.permit(:couleur, :type_id, :piece_id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:nom, :prix, :photo, :description, :couleur, :piece_id, :type_id)
    end
end
