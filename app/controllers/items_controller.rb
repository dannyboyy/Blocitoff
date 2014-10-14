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

  def edit
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

  private

  def item_params
    params.require(:item).permit(:body)
  end

end
