class ItemsController < ApplicationController
  def index
    @list_id = params[:list_id]
  	@items = Item.all
  end

  def show
    @list_id = params[:list_id]
  	@item = Item.find(params[:id])
  end

  def edit
  	@item = Item.find(params[:id])
  end

  def new
    @list_id = params[:list_id]
  	@item = Item.new
  end

  def create
    @list_id = params[:list_id]
  	@item = Item.new(item_params)
  	if @item.save
  		redirect_to item_path(@item)
  	else
  		render :new
  	end
  end

  def update
  	@item = Item.find(params[:id])
  	if @item.update(item_params)
  		redirect_to item_params(@item)
  	else
  		render :edit
  	end
  end

  def destroy
    @list_id = params[:list_id]
  	@item = Item.find(params[:id])
  	@item.destroy
  	redirect_to items_path
  end

  private
  	def item_params
  		params.require(:item).permit(:title, :body, :urgency, :complete, :list_id)
  	end

end