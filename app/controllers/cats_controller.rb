class CatsController < ApplicationController
  def index
    # GET /cats
    @cats = Cat.all
    render :index
  end

  def show
    @cat = Cat.find(params[:id])
    render :show
  end

  def new
    # GET /cats/new
    render :new
  end

  def create
    # POST /cats
    # { "cat": { "name": "Sally" } }
    @cat = Cat.new(params[:cat].permit(:name))

    if @cat.save
      redirect_to cat_url(@cat)
    else
      render json: @cat.errors.full_messages, status: :unprocessable_entity
    end
  end

  def edit
    # GET /cats/:id/edit

  end

  def update
    cat = Cat.find(params[:id])
    cat.update(params[:cat].permit(:name))
  end

  def destroy
    cat = Cat.find(params[:id])
    cat.destroy

    redirect_to cats_url
  end
end
