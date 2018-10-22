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

  def create
    # POST /cats
    # { "cat": { "name": "Sally" } }
    cat = Cat.new(name: params[:cat].permit(:name))
    cat.admin = false

    if cat.save
      render json: cat
    else
      render json: cat.errors.full_messages, status: :unprocessable_entity
      # raise "CatError"
    end
  end

  def update
    cat = Cat.find(params[:id])
    cat.update(params[:cat].permit(:name))
  end

  def destroy

  end
end
