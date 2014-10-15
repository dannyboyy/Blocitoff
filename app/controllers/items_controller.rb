class ItemsController < ApplicationController

  def index
    @items = Item.paginate(page: params[:page], per_page: 10)
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = current_user.items.build(item_params)
    if @item.save
      flash[:notice] = 'Your new to-do was saved successfully.'
      redirect_to @item
    else
      flash[:error] = 'Something went wrong. Your to-do was not saved.'
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update_attributes(params.require(:item).permit(:body, :complete))
      flash[:notice] = "Post was updated."
      redirect_to @item
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :edit
    end
  end

  def complete
    @item = Item.find(params[:id])
    @item.update_attribute(:completed_at, Time.now)
    redirect_to items_path, notice: "Todo item marked as complete."
  end

  private

  def item_params
    params.require(:item).permit(:body, :complete)
  end

end
