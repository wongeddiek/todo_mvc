class ItemsController < ApplicationController
  before_action :require_login
  before_action :set_item, only: [:show, :edit, :update, :destroy, :toggle]


  # GET /items
  # GET /items.json
  def index
    @items = Item.all
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)

    # check for current user's lists, ensuring the :list_id params belongs to the current_user
    @list = current_user.lists.find(params[:list_id])
    # set the new item.list to the @list
    @item.list = @list

    respond_to do |format|
      if @item.save
        format.html { redirect_to @list, notice: 'Item was successfully created.' }
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
      format.html { redirect_to @item.list, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # custom "toggle" action
  def toggle
    @item.update_attribute(:completed, !@item.completed)
    redirect_to @item.list, notice: 'item updated!'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = current_user.lists.find(params[:list_id]).items.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:description, :completed)
    end
end
