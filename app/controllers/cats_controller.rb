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
    @cat = Cat.new
    render :new
  end

  def create
    # POST /cats
    # { "cat": { "name": "Sally" } }
    @cat = Cat.new(cat_params)

    if @cat.save
      redirect_to cat_url(@cat)
    else
      # render json: @cat.errors.full_messages, status: :unprocessable_entity
      render :new
    end
  end

  def edit
    # GET /cats/:id/edit
    @cat = Cat.find(params[:id])
    render :edit
  end

  def update
    @cat = Cat.find(params[:id])
    if @cat.update(cat_params)
      redirect_to cat_url(@cat)
    else
      render :edit
    end
  end

  def destroy
    cat = Cat.find(params[:id])
    cat.destroy

    redirect_to cats_url
  end

  private

    def cat_params
      params[:cat].permit(:name, :skill)
    end
end
